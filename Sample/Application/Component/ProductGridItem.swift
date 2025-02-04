//
//  ProductDetailView.swift
//  Sample
//
//  Created by Akash Mehta on 29/01/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductGridItem : View {
    
    @ObservedObject var viewModel: ProductViewModel
    
    let product: Product
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product, viewModel: viewModel)) {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    
                    WebImage(url: URL(string: product.image))
                        .resizable()
                        .frame(width: 200, height: 200) 
                    
                    Text(product.title)
                        .lineLimit(2)
                        .font(.headline)
                        .foregroundColor(Color(.label))
                    
                    Text(product.price.asCurrency)
                        .font(.subheadline)
                        .foregroundColor(Color(.label))
                    
                    StartView(rating: product.rating.rate)
                }
                .frame(width: 150)
            }
        }
    }
}

