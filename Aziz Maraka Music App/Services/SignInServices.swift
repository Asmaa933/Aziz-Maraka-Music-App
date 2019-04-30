//
//  SignInServices.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
import Alamofire

class SignInServices {
    
    let headers = ["Content-Type": "application/json"]
    
    func signInUser(parameters: [String:Any],completion: @escaping (_ jsonData: RegisterResponseModel?,_ error:Error?) -> Void) {
        Alamofire.request(URLs.signInURL.rawValue.getFullURL(), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                let jsonDecoder = JSONDecoder()
                do{
                    let responseModel = try jsonDecoder.decode(RegisterResponseModel.self, from: response.data!)
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
