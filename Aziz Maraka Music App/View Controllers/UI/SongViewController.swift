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

class SongViewController: UIViewController{
    
    var audioList: NSArray?
    var songPlayer = AVAudioPlayer()
    var selectedIndex : Int?
    var currentSongName: String?
    var currentSongPath: URL?
    var currentSongIndex = 0
    var songIsPlaying = false
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var artistImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        readFromPlist()
        configureAVSession()
        playSelectedItemFromTableView()
        changeImages()
    }
    func playSelectedItemFromTableView(){
        
        prepareSongs()
        songPlayer.play()
        changePlayBtnState()
        
        changeSongTime()
    }
    
    @IBAction func checkRepeatSwitchState(_ sender: UISwitch) {
        
        if sender.isOn {
            songPlayer.numberOfLoops = -1
        }
    }
    
    func readFromPlist(){
        let path = Bundle.main.path(forResource: "SongsList", ofType: "plist")
        audioList = NSArray(contentsOf: URL(fileURLWithPath: path ?? "" )) ?? []
    }
    func configureAVSession(){
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: .allowBluetooth)
        }catch{
            
        }
        do{
            try AVAudioSession.sharedInstance().setActive(true)
        }catch{
            
        }
        
    }
    func prepareSongs(){
        setCurrentSong()
        do{
            try songPlayer =  AVAudioPlayer(contentsOf: currentSongPath!)
        }catch(let error){
            print(error)
        }
        
        
    }
    func setCurrentSong(){
        let currentSong = audioList?[currentSongIndex] as! [String:String]
        currentSongName = currentSong["SongName"]
        songNameLabel.text = currentSongName
        getSongPath()
    }
    func getSongPath(){
        let path = Bundle.main.path(forResource: currentSongName, ofType: "mp3")
        currentSongPath = URL(fileURLWithPath: path!)
        
    }
    @IBAction func logOutBtnTapped(_ sender: Any) {
        songPlayer.stop()
        LocalStore.sharedLocalStore.deleteAccessToken()
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: signInNavigationID)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = signInVC
    }
    
    @IBAction func changeSongBtnTaped(_ sender: UIButton) {
        currentSongIndex += sender.tag
        resetArrayIndex(index: currentSongIndex)
        prepareSongs()
        songIsPlaying = false
        changePlayBtnState()
        
    }
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        //songPlayer.delegate = self
        resetArrayIndex(index: currentSongIndex)
        changePlayBtnState()
        
    }
    
    func changePlayBtnState(){
        songPlayer.delegate = self
        if songIsPlaying{
            playBtn.setImage(UIImage(named: "Play"), for: .normal)
            songPlayer.pause()
            
        }else{
            playBtn.setImage(UIImage(named: "Pause"), for: .normal)
            songPlayer.play()
            
            
        }
        songIsPlaying = !songIsPlaying
        
    }
    func changeImages(){
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector (changeImage), userInfo: nil, repeats: true)
    }
    @objc func changeImage(){
        let randamIndex = Int(arc4random_uniform(8 + 1))
        artistImage.image = UIImage(named: "\(randamIndex)")
    }
    func resetArrayIndex(index: Int){
        if index < 0{
            currentSongIndex = (audioList?.count)! - 1
        }
        if index > (audioList?.count)! - 1{
            currentSongIndex = 0
        }
    }
    
    @IBAction func changeSongTime() {
        resetArrayIndex(index: currentSongIndex)
        songPlayer.currentTime = TimeInterval(slider.value)
        songPlayer.prepareToPlay()
        slider.maximumValue = Float(songPlayer.duration)
        slider.value = 0.0
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        songPlayer.play()
        
        
        
    }
    @objc func updateSlider(){
        slider.value = Float(songPlayer.currentTime)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        
        songPlayer.stop()
        LocalStore.songLocalStore.saveLastSongIndex(index: currentSongIndex)
        
    }
    
    
}

extension SongViewController :  AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            
            print("Audio player finished playing")
            
            self.songPlayer.stop()
            currentSongIndex += 1
            resetArrayIndex(index: currentSongIndex)
            prepareSongs()
            songPlayer.play()
        }
    }
}
