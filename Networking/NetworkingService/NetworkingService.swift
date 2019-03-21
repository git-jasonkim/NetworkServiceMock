//
//  NetworkingService.swift
//  Networking
//
//  Created by Jason Kim on 3/20/19.
//  Copyright © 2019 jklabs. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum Result<T, Error> {
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}

class NetworkingService {
    
    private var apiKey = "" // apply for api_key here: https://api.nasa.gov/index.html#apply-for-an-api-key
    private var session = URLSession(configuration: .default)
    
    public init() {}
    
    public func requestData(completion: @escaping (Result<APOD?, Error>)->()) {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)") else { return }
        
        let request: NSMutableURLRequest
        request = NSMutableURLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let task = self.session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let error = error {
                completion(Result(error: error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                default: break //handle http responses
                }
            }
            
            if let data = data {
                do {
                    let apod = try JSONDecoder().decode(APOD.self, from: data)
                    completion(Result(value: apod))
                } catch let error {
                    completion(Result(error: error))
                }
            }
        }
        
        task.resume()
    }
}
