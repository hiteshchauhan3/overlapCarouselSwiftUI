//
//  ViewModel.swift
//  CenteredOverlapCarousel
//
//  Created by Hitesh on 08/05/25.
//

import SwiftUI

final class ViewModel: ObservableObject {
  @Published private(set) var items: [Model] = []
  private let imageURLs: [String] = [
    "https://picsum.photos/id/10/800/600",
    "https://picsum.photos/id/20/800/600",
    "https://picsum.photos/id/30/800/600",
    "https://picsum.photos/id/40/800/600",
    "https://picsum.photos/id/50/800/600",
    "https://picsum.photos/id/60/800/600",
    "https://picsum.photos/id/70/800/600",
    "https://picsum.photos/id/80/800/600"
  ]

  init() {
    items = imageURLs.enumerated().map { index, url in
      Model(id: index, title: "Item \(index)", imageURL: url)
    }
  }
}
