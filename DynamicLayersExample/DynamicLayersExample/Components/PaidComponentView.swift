//
//  PaidComponentView.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct PaidComponentView: View {
    
    var title: String
    
    var body: some View {
        VStack(spacing: 20) {
            FullPackageLinkView()
        }
        .navigationTitle(title)
        .padding()
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        PaidComponentView(title: "Card")
    }
}
