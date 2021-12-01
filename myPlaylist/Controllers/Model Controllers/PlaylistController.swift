//
//  PlaylistController.swift
//  myPlaylist
//
//  Created by Anto Rados on 11/1/21.
//

import Foundation

class PlaylistController {
    
    // Shared instance
    static let shared = PlaylistController()
    
    // Source of Truth
    var playlists: [Playlist] = []
    
    // Create
    func createPlaylist(name: String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
        saveToPersistenceStore()
    }
    
    // Delete
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.firstIndex(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistenceStore()
    }
    
    
    // MARK:- Persistence
    
    // Persistence storage location
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("myPlaylist.json")
        
        return fileURL
    }
    
    // Save data
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: persistentStore())
        } catch {
            print(error)
            print(error.localizedDescription)
            print("We had an error saving to our persistence location")
        }
    }
    
    // Load data
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: persistentStore())
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
        } catch {
            print("We had an error loading our data from the persistence storage.")
            print(error)
            print(error.localizedDescription)
        }
    }
    
}
