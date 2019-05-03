//
//  LocalStore.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/1/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
class LocalStore {
    static let sharedLocalStore = LocalStore()
    let userDefaults =  UserDefaults.standard
   
    
    func saveAccessToken(token:String){
    userDefaults.set(token, forKey: accessToken)
    
    }
    
    func getAccessToken() -> String? {
      return  userDefaults.object(forKey: accessToken) as? String
    
    }
    func deleteAccessToken(){
        userDefaults.removeObject(forKey: accessToken)
    }
 
    static let songLocalStore = LocalStore()
    let songDefault = UserDefaults.standard
    func saveLastSongIndex(index: Int) {
        songDefault.set(index, forKey: lastSongIndexID)
        
    }
    func getLastSongIndex() -> Int {
        return songDefault.object(forKey: lastSongIndexID) as? Int ?? 0
    }
    
}
