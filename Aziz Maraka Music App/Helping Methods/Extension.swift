
//
//  Extensions.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 5/18/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation

extension String{
    // concatenate full url because Raw value for enum case must be a literal
    func getFullURL() -> String {
        return baseURL + self
    }
}

// convert time  from TimeInterval to minutes and seconds
extension TimeInterval{
    func convertTime() -> ( Int , Int){
        let convertedTime = Int(self)
        let minutes = convertedTime/60
        let seconds = convertedTime - minutes * 60
        return (minutes,seconds)
    }
}
