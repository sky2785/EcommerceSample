//
//  ProductApiReposirotyProtocol.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import Foundation

protocol ProductApiRepositoryProtocol {
    func getProducts() async throws -> [Product]
}
