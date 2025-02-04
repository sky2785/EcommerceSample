//
//  Product.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

struct Product: Identifiable, Codable {
  let id: Int
  let title: String
  let price: Double
  let description: String
  let image: String
  let category: String
  let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}
