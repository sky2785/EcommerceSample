//
//  ProductCategory.swift
//  Sample
//
//  Created by Akash Mehta on 29/01/25.
//

enum ProductCategory: String, CaseIterable {
    
    case all = "All"
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
    
    var title: String {
        switch self {
        case .all: return "All"
        case .electronics: return "Electronics"
        case .jewelery: return "Jewelry"
        case .menSClothing: return "Men's"
        case .womenSClothing: return "Women's"
        }
    }
}
