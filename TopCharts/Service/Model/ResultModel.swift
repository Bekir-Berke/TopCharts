//
//  ResultModel.swift
//  TopCharts
//
//  Created by Bekir Berke Yılmaz on 8.12.2023.
//

import Foundation
struct Song: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Album]
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let url: String
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

// MARK: - Result
struct Album: Codable {
    let artistName, id, name, releaseDate: String
    let kind: Kind
    let artistID: String
    let artistURL: String
    let contentAdvisoryRating: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case contentAdvisoryRating, artworkUrl100, genres, url
    }
}
extension Album{
    var artworkURL: URL {return URL(string: self.artworkUrl100)!}
}

// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case albums = "albums"
}
