//
//  CarouselItemView.swift
//  CenteredOverlapCarousel
//
//  Created by Hitesh on 08/05/25.
//

import SwiftUI

struct CarouselItemView: View {
  let item: Model
  let draggingIndex: Double
  let spacing: Double
  let minScale: CGFloat
  let itemSize: CGSize

  var body: some View {
    AsyncImage(url: URL(string: item.imageURL)) { image in
      image.resizable().aspectRatio(contentMode: .fill)
    } placeholder: {
      Color.gray.opacity(0.3)
    }
    .frame(width: itemSize.width, height: itemSize.height)
    .clipped()
    .cornerRadius(18)
    .scaleEffect(scale)
  }

  private var scale: CGFloat {
    let dist = abs(Double(item.id) - draggingIndex)
    return 1 - min(dist, 1) * (1 - minScale)
  }
}
