//  Copyright © 2024 varunpullur. All rights reserved.

import Foundation

extension Double {

  var asCurrency: String {

    String(format: "$%.2f", self)

  }

}
