//
//  Request.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import Foundation
import Alamofire

struct GetAllProducts : URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let apiURL = "https://fakestoreapi.com/products"
        guard let url = URL(string: apiURL) else {
            throw NetworkError.networkError("invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
