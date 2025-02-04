//
//  ProductDetailView.swift
//  Sample
//
//  Created by Akash Mehta on 04/02/25.
//


import SwiftUI

struct ProductDetailView: View {
  
  let product: Product
  @ObservedObject var viewModel: ProductViewModel

  var isInCart: Bool {

      viewModel.cartItems.contains(product.id)

  }

  var body: some View {

    ScrollView {

      VStack(alignment: .leading, spacing: 16) {

//        AsyncImageView(url: product.image, height: Constants.UI.productImageHeight)
//          .frame(maxWidth: .infinity)

          Image("Logo-google-icon-PNG")
              .resizable()
              .foregroundColor(.gray)
              .aspectRatio(contentMode: .fit)
          
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
              backgroundColor: isInCart ? AppColors.Button.destructive : AppColors.Button.primary
          ) {
            viewModel.toggleCart(for: product.id)
          }
          .padding(.top)

        }
        .padding(16)

      }

    }
    .navigationBarTitleDisplayMode(.inline)

  }
  
}
