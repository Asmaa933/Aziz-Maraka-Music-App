//
//  HomeViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/1/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class SongViewController: UIViewController {

    var audioList: NSArray?
    let songPlayer = AVPlayer()
    @IBOutlet weak var songNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
songNameLabel.text = "glaefhuazguahoahrowgrigreahoreag"
        // Do any additional setup after loading the view.
    updateUI()
        readFromPlist()
        prepareSongs()
    }
    func updateUI(){
        
    }
    func readFromPlist(){
        let path = Bundle.main.path(forResource: "SongsList", ofType: "plist")
        audioList = NSArray(contentsOf: URL(fileURLWithPath: path ?? "" )) ?? []
    }
    func prepareSongs(){
        do{
//try songPlayer = AVAudioPlayer(contentsOf: <#T##URL#>)
        }catch(let error){
            print(error)
        }
        
        
    }
    
    @IBAction func logOutBtnTapped(_ sender: Any) {
        LocalStore.sharedLocalStore.deleteAccessToken()
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: signInNavigationID)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = signInVC
    }
    
    @IBAction func changeSongBtnTaped(_ sender: UIButton) {
    }
}
