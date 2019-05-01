//
//  HomeViewController.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/1/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var songNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
songNameLabel.text = "glaefhuazguahoahrowgrigreahoreag"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutBtnTapped(_ sender: Any) {
        LocalStore.sharedLocalStore.deleteAccessToken()
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: signInViewControllerID) as! SignInViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = signInVC
    }
}
