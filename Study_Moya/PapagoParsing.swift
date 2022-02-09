//
//  PapagoParsing.swift
//  Study_Moya
//
//  Created by Bard on 2021/09/16.
//

import Foundation

struct PaPagoTrans : Codable {
    var message : Message?
    
    struct Message : Codable {
        var result : TrandInfo?
        
        struct TrandInfo : Codable{
            var translatedText : String?
            
        }
    }
}
