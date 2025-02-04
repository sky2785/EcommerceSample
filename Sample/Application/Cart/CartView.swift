//
//  MainCartView.swift
//  Sample
//
//  Created by Akash Mehta on 04/02/25.
//

import SwiftUI

struct CartView : View {
    @ObservedObject var viewModel: ProductViewModel
    @State private var showingThankYou = false
    var cartProducts: [Product] {
        viewModel.products.filter { viewModel.cartItems.contains($0.id) }
    }
    var totalAmount: Double {
        cartProducts.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if cartProducts.isEmpty {
                    
                    VStack {
                        
                        Image(systemName: "cart")
                            .font(.system(size: 60))
                            .foregroundColor(Color(.secondaryLabel))
                            .padding()
                        
                        Text("Your cart is empty")
                            .font(.headline)
                            .foregroundColor(Color(.secondaryLabel))
                        
                    }
                    
                } else {
                    VStack {
                        
                        
                        List {
                            ForEach(cartProducts) { product in
                                CartItem(product: product) {
                                    viewModel.toggleCart(for: product.id)
                                }
                            }
                        }
                        
                        VStack(spacing: 10) {
                            
                            HStack {
                                
                                Text("Total:")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text(totalAmount.asCurrency)
                                    .font(.headline)
                                
                            }
                            .padding(.horizontal, 16)
                            
                            CustomButton(
                                title: "Checkout",
                                iconName: nil,
                                backgroundColor: Color.blue
                            ) {
                                showingThankYou = true
                            }
                            
                        }
                        .padding(.vertical, 16)
                        .background(Color(.systemBackground))
                        
                    }
                }
            }
            .navigationTitle("Cart")
        }
        .alert("Thank You!", isPresented: $showingThankYou) {

          Button("OK") {

            viewModel.cartItems.removeAll()

          }

        } message: {

          Text("Your order has been placed successfully.")

        }
    }
}
