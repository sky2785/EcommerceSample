//
//  CartItem.swift
//  Sample
//
//  Created by Akash Mehta on 04/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItem: View {
    let product: Product
    var onDelete : () -> Void
    var body: some View {
        HStack (spacing: 10){
            WebImage(url: URL(string: product.image))
                .resizable()
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                
                Text(product.price.asCurrency)
                    .font(.subheadline)
                    .foregroundColor(Color(.label))
            }
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
        }
    }
}


