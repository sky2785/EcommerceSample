//
//  CustomButton.swift
//  Sample
//
//  Created by Akash Mehta on 04/02/25.
//


import SwiftUI

struct CustomButton: View {

  let title: String
  let iconName: String?
  let backgroundColor: Color
  let action: () -> Void

  var body: some View {

    Button(action: action) {

      HStack {

        if let iconName = iconName {

          Image(systemName: iconName)

        }

        Text(title)
          .font(.headline)

      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .padding()
      .background(backgroundColor)
      .cornerRadius(10)

    }
    .padding(.horizontal, 16)

  }
  
}
