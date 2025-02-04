//
//  ContentView.swift
//  Sample
//
//  Created by Akash Mehta on 29/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProductGridView(viewModel: ProductViewModel(repository: ProductApiRepository()))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
