//
//  SongTableViewController.swift
//  TopCharts
//
//  Created by Bekir Berke Yılmaz on 8.12.2023.
//

import UIKit
import Kingfisher

class SongTableViewController: UITableViewController {
    
    //TableView Data
    private var data: [Album] = []{
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    //Fetch the data when view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getTopCharts{result in
            switch result{
            case.success(let songs):
                self.data = songs.feed.results
            case.failure(let error):
                print(error)
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //Define rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count 
    }
    
    // Define cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongTableViewCell
        cell.artistNameLabel.text = data[indexPath.row].artistName
        cell.albumNameLabel.text = data[indexPath.row].name
        cell.albumCoverImageView.layer.cornerRadius = 5
        cell.albumCoverImageView.kf.setImage(with: data[indexPath.row].artworkURL)
        return cell
    }
    
    //Click the row and open selected album on Apple Music
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAlbumUrl = URL(string:( data[indexPath.row].url))
        tableView.deselectRow(at: indexPath, animated: true)
        UIApplication.shared.open(selectedAlbumUrl!)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
