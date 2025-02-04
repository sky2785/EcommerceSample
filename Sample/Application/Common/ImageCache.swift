//  Copyright © 2024 varunpullur. All rights reserved.

import SwiftUICore

actor ImageCache {

  static let shared = ImageCache()
  private var cache: [String: Image] = [:]
  private var inProgress: [String: Task<Image?, Error>] = [:]

  func image(for url: String) -> Image? {

    cache[url]

  }

  func setImage(_ image: Image, for url: String) {

    cache[url] = image
    inProgress[url] = nil

  }

  func clearCache() {

    cache.removeAll()
    inProgress.forEach { $0.value.cancel() }
    inProgress.removeAll()

  }
  
}
