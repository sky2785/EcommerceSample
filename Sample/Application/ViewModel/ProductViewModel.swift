//
//  ProductViewModel.swift
//  Sample
//
//  Created by Akash Mehta on 03/02/25.
//

import SwiftUI
import Combine
import Foundation
import Alamofire

class ProductViewModel: ObservableObject {
    @Published var products : [Product] = []
    @Published var selectedCategory: ProductCategory = .all
    @Published var isLoading = false
    @Published var cartItems: Set<Int> = []
    @Published var error: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let repository: ProductApiRepositoryProtocol
    
    var filteredProducts: [Product] {
        guard selectedCategory != .all else { return products }
        return products.filter { $0.category == selectedCategory.rawValue }
    }
    
    init(repository : ProductApiRepository) {
        self.repository = repository
    }
    
    func fetchProduct() {
        isLoading = true
        error = nil
        
        repository.getProducts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
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

