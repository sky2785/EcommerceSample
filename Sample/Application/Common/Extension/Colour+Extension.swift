//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUICore
import UIKit

extension Color {

  static func dynamic(light: Color, dark: Color) -> Color {

    return Color(.init { trait in

      return trait.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)

    })

  }

}
