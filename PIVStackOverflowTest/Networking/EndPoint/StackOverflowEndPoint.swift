//
//  StackOverflowEndPoint.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/1/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

//easy to add additional cases

enum NetworkEnvironment {
    case production
}


public enum StackOverflowApi {
    case def
}

extension StackOverflowApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
            default: return "https://api.stackexchange.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        default:
            return "2.2/users"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        
        switch self {
        case .def:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["site":"stackoverflow"])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


