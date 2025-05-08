//
//  CarouselContent.swift
//  CenteredOverlapCarousel
//
//  Created by Hitesh on 08/05/25.
//

import SwiftUI

struct CarouselContent: View {
  let items: [Model]
  @Binding var snappedIndex: Double
  @Binding var draggingIndex: Double
  @Binding var activeIndex: Int

  let itemSize: CGSize
  let spacing: Double
  let bounceLimit: Double
  let minScale: CGFloat

  var body: some View {
    ZStack {
      ForEach(items) { item in
        CarouselItemView(
          item: item,
          draggingIndex: draggingIndex,
          spacing: spacing,
          minScale: minScale,
          itemSize: itemSize
        )
        .offset(x: xOffset(for: item.id), y: 0)
        .zIndex(zIndex(for: item.id))
      }
    }
    .gesture(dragGesture)
    .frame(height: itemSize.height)
  }

  private var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        let candidate = snappedIndex - value.translation.width / spacing
        draggingIndex = clamp(candidate,
                              lower: -bounceLimit,
                              upper: Double(items.count - 1) + bounceLimit)
      }
      .onEnded { value in
        let raw = snappedIndex - value.predictedEndTranslation.width / spacing
        let rounded = round(raw)
        let clamped = clamp(rounded, lower: 0, upper: Double(items.count - 1))
        withAnimation(.interpolatingSpring(stiffness: 300, damping: 25)) {
          snappedIndex = clamped
          draggingIndex = clamped
          activeIndex = Int(clamped)
        }
      }
  }

  private func xOffset(for item: Int) -> CGFloat {
    CGFloat((Double(item) - draggingIndex) * spacing)
  }

  private func zIndex(for item: Int) -> Double {
    1 - abs(Double(item) - draggingIndex) * 0.1
  }

  private func clamp(_ value: Double, lower: Double, upper: Double) -> Double {
    min(max(value, lower), upper)
  }
}
