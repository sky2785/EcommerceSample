//
//  ProductApiRepository.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import Foundation
import Alamofire

class ProductApiRepository: ProductApiRepositoryProtocol {
    
    func getProducts() async throws -> [Product] {
        
        do {
            let response = try await AF.request(GetAllProducts())
                .validate()
                .serializingDecodable([Product].self)
                .value
            
            return response
        } catch {
            if let afError = error as? AFError, let statusCode = afError.responseCode {
                throw NetworkError.fromStatusCode(statusCode) ?? .networkError(error.localizedDescription)
            }
            throw NetworkError.networkError(error.localizedDescription)
        }
    }
}
