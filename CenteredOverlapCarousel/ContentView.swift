//
//  ContentView.swift
//  CenteredOverlapCarousel
//
//  Created by Hitesh on 08/05/25.
//

import SwiftUI

struct CarouselView: View {
  @StateObject var viewModel: ViewModel
  @State private var snappedIndex: Double = 0
  @State private var draggingIndex: Double = 0
  @State private var activeIndex: Int = 0

  private let itemSize = CGSize(width: 250, height: 250)
  private let spacing: Double = 200
  private let bounceLimit: Double = 0.5
  private let minScale: CGFloat = 0.75

  var body: some View {
    VStack(spacing: 20) {
      CarouselContent(
        items: viewModel.items,
        snappedIndex: $snappedIndex,
        draggingIndex: $draggingIndex,
        activeIndex: $activeIndex,
        itemSize: itemSize,
        spacing: spacing,
        bounceLimit: bounceLimit,
        minScale: minScale
      )

      PageControl(count: viewModel.items.count, activeIndex: activeIndex)
    }
    .onAppear { resetCarousel() }
    .padding()
  }

  private func resetCarousel() {
    snappedIndex = 0
    draggingIndex = 0
    activeIndex = 0
  }
}

struct CarouselView_Previews: PreviewProvider {
  static var previews: some View {
    CarouselView(viewModel: ViewModel())
  }
}
