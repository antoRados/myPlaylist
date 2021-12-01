//
//  Song.swift
//  myPlaylist
//
//  Created by Anto Rados on 11/1/21.
//

import Foundation

// : Codable protocol allows you to serialize data (for local or network persistence)
class Song: Codable {
    let title: String
    let artistName: String

    init(title: String, artistName: String) {
        self.title = title
        self.artistName = artistName
    }
} //End of "Song" class

// : Equatable protocol allows you to compare two instances of an object, to check if they are the same or not
extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.title == rhs.title && lhs.artistName == rhs.artistName
    }
} //End "Equatable" extension
