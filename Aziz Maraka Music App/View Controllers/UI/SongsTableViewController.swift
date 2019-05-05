//
//  SongsTableViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/3/19.
//  Copyright © 2019 AsMaa. All rights reserved.


import UIKit

class SongsTableViewController: UIViewController {
    
   
    @IBOutlet weak var songsTable: UITableView!
    @IBOutlet weak var songLabel: UILabel!
    var songsList: NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
songsTable.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
}
extension SongsTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: songTableViewCellID, for: indexPath)
        return cell
    }
    
    
    }


