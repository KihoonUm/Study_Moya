//
//  JokeAPI.swift
//  Study_Moya
//
//  Created by Bard on 2021/09/16.
//

import Foundation
import Moya

enum JokeAPI {
    case randomJokes(_ firstName : String? = nil, _ lastName : String? = nil)
}
// baseURL : 서버의 base URL / Moya는 이를 통하여 endPoint 를 생성
// path : 서버의 base URL뒤에 추가 될 Path( 일반적으로 API )
// Method : HTTP Method ( get, post, delete, patch 등)
// sampleData : 테스트용 Mock Data
// task : 리퀘스트에 사용되는 파라미터 설정
extension JokeAPI : TargetType{
    var baseURL: URL {
       return URL(string: "https://api.icndb.com")!
    }
    
    var path: String {
        switch self {
        case .randomJokes(_ ,_ ):
            return "/jokes/random"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .randomJokes(_ ,_ ):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .randomJokes(let firstName, let lastName):
            let params : [String : Any] = [
                "firstName" : firstName!,
                "lastName" : lastName!
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    
}
