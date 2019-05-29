//
//  SignInServices.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
import Alamofire

//user name: asmaa2019@gmail.com
//password:12345678
class SignInServices {
    
    func signInUser(parameters: [String:Any],completion: @escaping (_ jsonData: SignInModel?,_ error:Error?) -> Void) {
        let headers = ["Content-Type": "application/json"]
        Alamofire.request(URLs.signInURL.rawValue.getFullURL(), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                let jsonDecoder = JSONDecoder()
                do{
                    let responseModel = try jsonDecoder.decode(SignInModel.self, from: response.data!)
                    
                    if let theAccessToken = responseModel.access_token{
                    LocalStore.sharedLocalStore.saveAccessToken(token: theAccessToken)
                    }
                    completion(responseModel, nil)
                }catch(let error){
                    completion(nil,error)
                    
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil,error)
            }
        }
    }
    
}
