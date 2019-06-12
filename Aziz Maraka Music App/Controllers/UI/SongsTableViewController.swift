//
//  SongsTableViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/3/19.
//  Copyright © 2019 AsMaa. All rights reserved.


import UIKit

class SongsTableViewController: UIViewController {
    @IBOutlet weak var songsTable: UITableView!
 
    @IBOutlet weak var searchBarr: UISearchBar!
    var songsList = NSArray()
    var songNames = [String]()
    var totalSongsArr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTable.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        readFromPlist()
        convertArrayToString()
    }
    
    func readFromPlist(){
        let path = Bundle.main.path(forResource: "SongsList", ofType: "plist")
        songsList = NSArray(contentsOf: URL(fileURLWithPath: path ?? "" )) ?? []
    }
    func convertArrayToString(){
        for index in 0..<songsList.count{
        let currentSong = songsList[index] as! [String:String]
        let currentSongName = currentSong["SongName"]
       songNames.append(currentSongName ?? "")
        }
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
        return songNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: songTableViewCellID, for: indexPath)
        let currentSong = songNames[indexPath.row]
        
        cell.textLabel?.text = currentSong
        return cell
    }
}

extension SongsTableViewController :  UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            songNames = []
            convertArrayToString()
            songsTable.reloadData()
        return
        }
          print(songNames)
        print (songsList)
            songNames = songNames.filter { (song) -> Bool in
                guard let text = searchBarr.text else {return false}
              return song.lowercased().contains(text.lowercased())
                }
                songsTable.reloadData()
            }
        }



