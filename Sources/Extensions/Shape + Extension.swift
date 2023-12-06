//
//  Shape + Extension.swift
//  PracticeSwiftui
//
//  Created by DynamicLayers on 17/11/2023.
//

import SwiftUI

@available(iOS 13.0, *)
extension Shape {
    public func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 0) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

@available(iOS 13.0, *)
extension InsettableShape {
    public func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 0) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
