

import Foundation

extension Double {

  var asCurrency: String {

    String(format: "$%.2f", self)

  }

}
