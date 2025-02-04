//
//  ProductGridView.swift
//  Sample
//
//  Created by Akash Mehta on 29/01/25.
//

import SwiftUI

struct ProductGridView: View {
    
    @ObservedObject var viewModel: ProductViewModel
    
    let columns = [
        
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
        
    ]
    var body: some View {
        NavigationView {
            VStack {
                ScrollView (.horizontal , showsIndicators: false) {
                    HStack {
                        ForEach(ProductCategory.allCases, id: \.self) { category in
                            CategoryButton(category: category,
                                           isSelected: viewModel.selectedCategory == category) {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    viewModel.selectedCategory = category
                                }
                            }
                        }
                        .padding()
                    }
                }
                Divider()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.filteredProducts) { product in
                            ProductGridItem(viewModel: viewModel, product : product)
                        }
                    }
                }
            }
            .navigationTitle("Sample")
        }.onAppear {
            viewModel.fetchProduct()
        }
    }
}

