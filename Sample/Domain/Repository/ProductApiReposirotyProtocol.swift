//
//  ProductApiReposirotyProtocol.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import Foundation
import Combine

protocol ProductApiRepositoryProtocol {
    func getProducts() -> AnyPublisher<[Product], NetworkError>
}
