//
//  ProductApiRepository.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import Foundation
import Alamofire
import Combine

class ProductApiRepository: ProductApiRepositoryProtocol {
    func getProducts() -> AnyPublisher<[Product], NetworkError> {
        print("HERE")
        return AF.request(GetAllProducts())
            .validate()
            .publishDecodable(type: [Product].self)
            .value()
            .mapError{ error in
                
                if let statusCode = error.responseCode,
                   let networkError = NetworkError.fromStatusCode(statusCode) {
                    return networkError
                }
                return NetworkError.networkError(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
