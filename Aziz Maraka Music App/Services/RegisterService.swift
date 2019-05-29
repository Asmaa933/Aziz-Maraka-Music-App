//
//  RegisterServices.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
import Alamofire

/*
 name : string
 email :string
 agency:string
 loc: string
 regcod :777777
 var password:string
 var password_confirmation: string
 */
class RegisterService  {
    
    let headers = ["accept": "application/json"]
   
    func registerNewUser(parameters: [String:Any],completion: @escaping (_ jsonData: RegisterResponseModel?,_ error:Error?) -> Void) {
        Alamofire.request(URLs.registerURL.rawValue.getFullURL(), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
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
