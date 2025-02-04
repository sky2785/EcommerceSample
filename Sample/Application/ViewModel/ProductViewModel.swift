//
//  ProductViewModel.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import SwiftUI
import Foundation
import Alamofire

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var selectedCategory: ProductCategory = .all
    @Published var isLoading = false
    @Published var cartItems: Set<Int> = []
    @Published var error: String?
    
    private let repository: ProductApiRepositoryProtocol
    
    var filteredProducts: [Product] {
        guard selectedCategory != .all else { return products }
        return products.filter { $0.category == selectedCategory.rawValue }
    }
    
    init(repository: ProductApiRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchProduct() {
        isLoading = true
        error = nil
        
        Task {
            do {
                products = try await repository.getProducts()
            } catch {
                self.error = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    func toggleCart(for productId: Int) {
        if cartItems.contains(productId) {
            cartItems.remove(productId)
        } else {
            cartItems.insert(productId)
        }
    }
    
    func itemCount(for category: ProductCategory) -> Int {
        guard category != .all else { return products.count }
        return products.filter { $0.category == category.rawValue }.count
    }
}
