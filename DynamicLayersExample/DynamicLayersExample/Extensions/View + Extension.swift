//
//  View + Extension.swift
//  DynamicLayersExample
//
//  Created by Zeeshan Suleman on 29/11/2023.
//

import SwiftUI

extension View {
    func FullPackageLinkView() -> some View {
        Text("Full Package At \n www.dynamiclayers.de")
            .font(.system(size: 30, weight: .bold))
            .multilineTextAlignment(.center)
            .tint(.red)
    }
}
