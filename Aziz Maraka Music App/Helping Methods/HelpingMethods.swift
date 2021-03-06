//
//  HelpingMethods.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
import UIKit

func checkTextFieldsAreEmpty(txts: [UITextField]) -> Bool{
    return txts.isEmpty
    
}

func showActivityIndicator(view: UIView) -> UIActivityIndicatorView{
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    activityIndicator.color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    activityIndicator.center = view.center
    activityIndicator.startAnimating()
    view.addSubview(activityIndicator)
    return activityIndicator
}

func removeActivityIndicator(activityIndicator: UIActivityIndicatorView){
    activityIndicator.stopAnimating()
    activityIndicator.removeFromSuperview()
    
}

