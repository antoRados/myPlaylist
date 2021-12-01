//
//  SongTableViewController.swift
//  myPlaylist
//
//  Created by Anto Rados on 11/1/21.
//

import UIKit

class SongTableViewController: UITableViewController {

    // Outlets
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    var playlist: Playlist?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Add song action
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songTitle = songTitleTextField.text,
              let artistName = artistNameTextField.text,
                  !songTitle.isEmpty,
                  !artistName.isEmpty,
              let playlist = playlist else { return }
        
        SongController.createSong(title: songTitle, artistName: artistName, playlist: playlist)
        
        songTitleTextField.text = ""
        artistNameTextField.text = ""
        
        tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    
    // Sets number of rows in each section of the table view (section defaulted to 1)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let playlist = playlist else { return cell }
        
        // Song constant that receives information from the playlist.song function at the index location given by indexPath.row
        let song = playlist.songs[indexPath.row]
        
        // Displays song title and artist name on the appropriate text label
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artistName

        return cell
    
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            let songToDelete = playlist.songs[indexPath.row]
            SongController.deleteSong(song: songToDelete, playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
} //End of "SongTableViewController" class
