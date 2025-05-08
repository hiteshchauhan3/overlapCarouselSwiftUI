CarouselView Component

A modular, SwiftUI-based carousel with snapping, scaling, and a gentle bounce effect. Built for easy integration and customization, this component displays a horizontally scrollable set of items with dynamic scaling and page indicators.

Features

Snapping: Items snap to the nearest position when dragging ends.

Scaling: Centered item scales up while others shrink smoothly.

Bounce Effect: Gentle overscroll bounce at the ends using a spring animation.

Page Control: Customizable dot indicators to reflect the active item.

Modular Structure: Separated into CarouselView, CarouselContent, CarouselItemView, and PageControl for clarity and reusability.

Requirements

Xcode 14+ / Swift 5.7+

iOS 15+ / macOS 12+

SwiftUI

Installation

Copy Source Files

Add CarouselView.swift (and its supporting structs) to your SwiftUI project.

Import

import SwiftUI

Usage

struct ContentView: View {
    var body: some View {
        CarouselView()
    }
}

Configuration

Property

Description

Default

itemSize

Size of each carousel item

250×250

spacing

Horizontal spacing between items (points)

200

bounceLimit

Max overscroll fraction (in items)

0.5

minScale

Minimum scale factor for off-center items

0.75

To customize, simply initialize CarouselView with different constants or adjust within your copy of the component.

Components

CarouselView: Top-level container managing state and layout.

CarouselContent: Renders items in a ZStack, applies offsets, scaling, and handles gestures.

CarouselItemView: Displays individual items via AsyncImage and applies per-item scale.

PageControl: Dot indicators reflecting the current active index.

Example

struct ExampleView: View {
    var body: some View {
        CarouselView()
    }
}

License

This project is available under the MIT License. Feel free to use and modify it in your own applications.
