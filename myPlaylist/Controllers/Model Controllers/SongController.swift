//
//  SongController.swift
//  myPlaylist
//
//  Created by Anto Rados on 11/1/21.
//

import Foundation

class SongController {
    
    //Create songs
   static func createSong(title: String, artistName: String, playlist: Playlist) {
        let newSong = Song(title: title, artistName: artistName)
        playlist.songs.append(newSong)
        PlaylistController.shared.saveToPersistenceStore()
    }
    
    //Delete songs
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistenceStore()
    }
}
