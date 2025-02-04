//
//  StartView.swift
//  Sample
//
//  Created by Akash Mehta on 04/02/25.
//

import SwiftUI

struct StartView: View {
    let rating: Double
    let maxStars = 5
    var body: some View {
        HStack {
            ForEach(0..<Int(maxStars), id: \.self) { index in
                
                Image(systemName: index < Int(rating) ? "star.fill" : index < Int(ceil(rating)) ? "star.leadinghalf.filled" : "star" )
                    .foregroundColor(.yellow)
            }
        
        }
    }
}

