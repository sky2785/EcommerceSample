//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUICore

enum AppColors {

  static let primary = Color.blue
  static let background = Color(.systemBackground)
  static let secondaryBackground = Color(.systemGray6)
  static let text = Color(.label)
  static let secondaryText = Color(.secondaryLabel)
  static let accent = Color.yellow
  static let destructive = Color.red

  enum Button {

    static let primary = Color.blue
    static let destructive = Color.red
    static let disabled = Color.gray.opacity(0.5)

  }

  enum Category {

    static let selected = Color.blue
    static let unselected = Color.gray.opacity(0.2)

  }
  
}
