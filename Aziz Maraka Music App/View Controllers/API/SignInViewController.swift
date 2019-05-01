//
//  SignUpViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit


class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    let signInServices = SignInServices()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func loginBtnTapped(_ sender: UIBarButtonItem) {
        let parameters : [String:Any] = [
            "grant_type":"password",
            "client_id":"4",
            "client_secret":"LrbVj77cLHzm2IYgWs1pNVv261hjmQIjZyUeybHE",
            "username" : emailTxt.text ?? "no email ",
            "password" : passwordTxt.text ?? "no password",
            "scope":"*"
        ]
        signInServices.signInUser(parameters: parameters) { (responseModel, error) in
            if responseModel != nil && error == nil{
             print(responseModel?.access_token ?? "no access token")
                let songVC = self.storyboard?.instantiateViewController(withIdentifier: SongViewControllerID) as! SongViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = songVC
                
    
            
        }
        
    }
    }

}
