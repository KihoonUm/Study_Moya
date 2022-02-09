//
//  PaPagoAPI.swift
//  Study_Moya
//
//  Created by Bard on 2021/09/16.
//

import Foundation
import Moya

enum PapagoAPI {
    
    case transText(_ text : String?)
}

extension PapagoAPI : TargetType{
    
    var baseURL: URL {
        return URL(string: "https://openapi.naver.com")!
    }
    
    var path: String {
        return "/v1/papago/n2mt"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {

        switch self {
        case .transText(let text):
            let params : [String : Any] = [
                    "source" : "en",
                    "target" : "ko",
                    "text" : text ?? ""
                ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let header = ["Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8",
                      "X-Naver-Client-Id" : "L9L93q1JdFpJd5vmEp7d",
                      "X-Naver-Client-Secret" : "sz2VYgnYho"]
      return header
    }
}
