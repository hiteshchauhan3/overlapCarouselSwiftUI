//
//  CenteredOverlapCarouselApp.swift
//  CenteredOverlapCarousel
//
//  Created by Hitesh on 08/05/25.
//

import SwiftUI

@main
struct CenteredOverlapCarouselApp: App {
  var body: some Scene {
    WindowGroup {
      CarouselView(viewModel: ViewModel())
    }
  }
}
