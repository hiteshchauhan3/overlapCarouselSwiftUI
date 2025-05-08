//
//  PageControl.swift
//  CenteredOverlapCarousel
//
//  Created by Hitesh on 08/05/25.
//

import SwiftUI

struct PageControl: View {
  let count: Int
  let activeIndex: Int

  var body: some View {
    HStack(spacing: 8) {
      ForEach(0..<count, id: \ .self) { index in
        Circle()
          .fill(index == activeIndex ? Color.primary : Color.secondary.opacity(0.4))
          .frame(width: 8, height: 8)
      }
    }
  }
}
