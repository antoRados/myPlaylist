//
//  Playlist.swift
//  myPlaylist
//
//  Created by Anto Rados on 11/1/21.
//

import Foundation

// : Codable protocol allows you to serialize data (for local or network persistence)
class Playlist: Codable {
    let name: String
    var songs: [Song]
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
} // End "Playlist" class

// : Equatable protocol allows you to compare two instances of an object, to check if they are the same or not
extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name && lhs.songs == rhs.songs
    }
} //End "Equatable" extension
