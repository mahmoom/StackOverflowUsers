//
//  NetworkManager.swift
//
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/1/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func getStackOverflowUsers(completion: @escaping (Result<[User], DataResponseError>)->())
}

struct NetworkManager: NetworkManagerProtocol {
    static let environment : NetworkEnvironment = .production
    static let NasaAPIKey = ""
    let router = Router<StackOverflowApi>()
    
    func getStackOverflowUsers(completion: @escaping (Result<[User], DataResponseError>)->()){
        router.request(.def) { (data, response, error) in
            if error != nil {
                completion(.failure(.network))
            }
            guard let response = response as? HTTPURLResponse,
                response.hasSuccessStatusCode, let responseData = data else{
                    completion(.failure(.network))
                    return
            }
            do {
                let apiResponse = try JSONDecoder().decode(Wrapper<User>.self, from: responseData)
                completion(.success(apiResponse.items))
            }catch {
                completion(.failure(.decoding))
            }
        }
    }
}
