//  Copyright © 2024 varunpullur. All rights reserved.

import Foundation
import UIKit

enum Constants {

  enum UI {

    static let gridSpacing: CGFloat = 16
    static let cornerRadius: CGFloat = 10
    static let productImageHeight: CGFloat = 300
    static let thumbnailSize: CGFloat = 150
    static let cartThumbnailSize: CGFloat = 50
    static let minimumSpacing: CGFloat = 10
    static let standardPadding: CGFloat = 16

  }

  enum Animation {

    static let defaultDuration: Double = 0.3

  }

  enum Cache {

    static let imageCache = NSCache<NSString, UIImage>()
    static let maximumCacheSize = 100

  }

}
