//
//  RegisterModel.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
class RegisterModel{
    var name:String
    var email:String
    var agency:String
    var loc:String
    var regcod:String
    var password:String
    var password_confirmation:String
    init(name:String,email:String,agency:String,loc:String,regcod:String, password:String,password_confirmation:String) {
        self.name = name
        self.email = email
        self.agency = agency
        self.loc = loc
        self.regcod = regcod
        self.password = password
        self.password_confirmation = password_confirmation
        
        
    }
}
