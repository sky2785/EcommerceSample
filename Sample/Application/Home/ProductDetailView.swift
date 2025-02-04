//
//  ProductDetailView.swift
//  Sample
//
//  Created by Akash Mehta on 04/02/25.
//


import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @ObservedObject var viewModel: ProductViewModel
    
    var isInCart: Bool {
        viewModel.cartItems.contains(product.id)
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {
                
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.label))
                    
                    Text(product.price.asCurrency)
                        .font(.title3)
                        .foregroundColor(Color(.secondaryLabel))
                    
                    StartView(rating: product.rating.rate)
                    Text("(\(product.rating.count) reviews)")
                        .font(.subheadline)
                        .foregroundColor(Color(.secondaryLabel))
                    
                    Text(product.description)
                        .padding(.top)
                        .foregroundColor(Color(.label))
                    
                    Spacer()
                    
                    CustomButton(
                        title: isInCart ? "Remove from Cart" : "Add to Cart",
                        iconName: isInCart ? "cart.badge.minus" : "cart.badge.plus",
                        backgroundColor: isInCart ? .red : .blue
                    ) {
                        viewModel.toggleCart(for: product.id)
                    }
                    .padding(.top)
                    
                }
                .padding(16)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .scrollIndicators(.hidden)
    }
}
