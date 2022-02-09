//
//  Joke.swift
//  Study_Moya
//
//  Created by Bard on 2021/09/16.
//

import Foundation

struct Joke : Codable {
    var tyoe : String?
    var value : Value?
    
    struct Value : Codable {
        var id : Int?
        var joke : String?
    }
}
