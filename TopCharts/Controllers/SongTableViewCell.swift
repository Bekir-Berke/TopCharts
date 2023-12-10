//
//  SongTableViewCell.swift
//  TopCharts
//
//  Created by Bekir Berke Yılmaz on 8.12.2023.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
