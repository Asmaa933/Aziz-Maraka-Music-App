//
//  RegisterServices.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
import Alamofire

class RegisterService  {
    
    let headers = ["accept": "application/json"]
   
    func registerNewUser(parameters: [String:Any],completion: @escaping (_ success:Bool,_ error:Error?) -> Void) {
        Alamofire.request(URLs.registerURL.rawValue.getFullURL(), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                if let json = response.result.value as? [String:Any]{
                    print("\nJSON: \n \(json)")
                   
                    guard  let id =  json["id"] as? Int else{
                        print("cannot find id")
                        return
                    }
                    //return to which call completion
                    completion(true, nil)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(false,error)
            }
}
}
}
