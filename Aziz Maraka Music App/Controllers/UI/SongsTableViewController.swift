//
//  SongsTableViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/3/19.
//  Copyright © 2019 AsMaa. All rights reserved.


import UIKit

class SongsTableViewController: UIViewController {
    @IBOutlet weak var songsTable: UITableView!
    var songsList = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTable.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        readFromPlist()
    }
    
    func readFromPlist(){
        let path = Bundle.main.path(forResource: "SongsList", ofType: "plist")
        songsList = NSArray(contentsOf: URL(fileURLWithPath: path ?? "" )) ?? []
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectSong" {
            
            if let dest = segue.destination as? SongViewController,
                let selectedRowIndexindex = self.songsTable.indexPathForSelectedRow{
                dest.currentSongIndex = selectedRowIndexindex.row
            }
        }
        if segue.identifier == "playBtn"{
            let songStored = LocalStore.songLocalStore.getLastSongIndex()
            if let dest = segue.destination as? SongViewController{
                dest.currentSongIndex = songStored
            }
        }
        
    }
}
extension SongsTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: songTableViewCellID, for: indexPath)
        let currentSong = songsList[indexPath.row] as! [String:String]
        let currentSongName = currentSong["SongName"]
        cell.textLabel?.text = currentSongName
        return cell
    }
}


