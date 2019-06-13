//
//  ViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // array of outlets
    @IBOutlet var newUserInfo: [UITextField]!
    
    let registerService = RegisterService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    func checkTxtfields(){
        //check all fields entered
        if checkTextFieldsAreEmpty(txts: []){
    let alert = UIAlertController(title: "alert", message: "Please fill all Fields", preferredStyle: .alert)
    let action =  UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
    }
    }
    
    
    @IBAction func doneBtnTapped(_ sender: UIBarButtonItem) {
       checkTxtfields()
        let parameters : [String:Any] = ["name" : newUserInfo[0].text ?? ""  ,
                                         "email" : newUserInfo[1].text ?? "" ,
                                         "agency" : newUserInfo[2].text ?? "" ,
                                         "loc":newUserInfo[3].text ?? ""  ,
                                         "regcod" : newUserInfo[4].text ?? "" ,
                                         "password" : newUserInfo[5].text ?? ""  ,
                                         "password_confirmation" :newUserInfo[6].text ?? ""
                                        ]

        registerService.registerNewUser(parameters: parameters) { (responseModel, error) in
            if responseModel != nil && error == nil {
                print(responseModel?.id ?? 0)
        }
    
}
}


}


