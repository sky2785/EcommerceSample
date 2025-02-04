//
//  CategoryButton.swift
//  Sample
//
//  Created by Akash Mehta on 29/01/25.
//

import SwiftUI

struct CategoryButton: View {
    let category : ProductCategory
    let isSelected: Bool
    let action : () -> Void
    var body: some View {
        Button (action: action) {
            Text(category.title)
                .font(.subheadline)
                .padding(.horizontal , 10)
                .padding(.vertical , 10)
                .foregroundColor(isSelected ? .black : .gray)
                .background(isSelected ? .gray : .white )
                .cornerRadius(20)
        }
    }
}

