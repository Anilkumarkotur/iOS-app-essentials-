//
//  NetworkManger.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 03/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import Foundation

public enum ApiErrors: Error {
    case jsonSerialization
    case jsonUnmarshalling
    case invalidURL
    case noResponse
    case notFound
    case conflict
}


class APIResponse: Decodable {
    let success: Bool
    let data: Int
    let errors: Int
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
        case errors = "errors"
    }
}

class CountrySearchInteractor {
    
    public static let shared = CountrySearchInteractor()
    init() {}
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    
    private let apiKey = "PUT_API KEY HERE"
    
    private let jsonDecoder: JSONDecoder = {
       let jsonDecoder = JSONDecoder()
       jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-mm-dd"
       jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
       return jsonDecoder
    }()
    
    func getDataFor(urlString: String, completion: @escaping (Swift.Result<APIResponse, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {
                completion(.failure(ApiErrors.noResponse))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(json))
            } catch {
                print("didnt work")
            }
            
        }.resume()
    }
}


public enum Result<APIResponse> {
    case result(APIResponse)
    case error(Error)
}
