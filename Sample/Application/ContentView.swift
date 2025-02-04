//
//  ContentView.swift
//  Sample
//
//  Created by Akash Mehta on 29/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    @StateObject private var viewModel = ProductViewModel(repository: ProductApiRepository())

    var body: some View {

      TabView(selection: $selectedTab) {

        ProductGridView(viewModel: viewModel)
          .tabItem {

            Label("Home", systemImage: "house")

          }
          .tag(0)

        CartView(viewModel: viewModel)
          .tabItem {

            Label("Cart", systemImage: "cart")

          }
          .tag(1)
          .badge(viewModel.cartItems.isEmpty ? 0 : viewModel.cartItems.count)

      }

    }
    
  }

#Preview {
    ContentView()
}
