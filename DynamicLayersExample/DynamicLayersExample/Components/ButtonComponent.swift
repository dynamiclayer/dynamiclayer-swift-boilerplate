//
//  ButtonComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI
import DynamicLayers

struct ButtonComponent: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .primary,
                        "Primary Button XL",
                        icon: ("ic_PlaceholderWhite", "ic_PlaceholderWhite")
                    )
                    
                    CKButtonView(
                        .large,
                        .primary,
                        "Primary Button L"
                    )
                    
                    CKButtonView(
                        .medium,
                        .primary,
                        "Primary Button M",
                        icon: ("ic_PlaceholderWhite", "ic_PlaceholderWhite")
                    )
                    
                    CKButtonView(
                        .small,
                        .primary,
                        "Primary Button S"
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .primary,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    CKButtonView(
                        .large,
                        .primary,
                        "Primary Button L",
                        disable: true
                    )
                    
                    CKButtonView(
                        .medium,
                        .primary,
                        "Primary Button M",
                        disable: true
                    )
                    
                    CKButtonView(
                        .small,
                        .primary,
                        "Primary Button S",
                        disable: true
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Secondary Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .secondary,
                        "Primary Button XL"
                    )
                    
                    CKButtonView(
                        .large,
                        .secondary,
                        "Primary Button L"
                    )
                    
                    CKButtonView(
                        .medium,
                        .secondary,
                        "Primary Button M"
                    )
                    
                    CKButtonView(
                        .small,
                        .secondary,
                        "Primary Button S"
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Secondary Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .secondary,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    CKButtonView(
                        .large,
                        .secondary,
                        "Primary Button L",
                        disable: true
                    )
                    
                    CKButtonView(
                        .medium,
                        .secondary,
                        "Primary Button M",
                        disable: true
                    )
                    
                    CKButtonView(
                        .small,
                        .secondary,
                        "Primary Button S",
                        disable: true
                    )
                }

                VStack(alignment: .leading) {
                    HStack {
                        Text("Tertiary Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .tertiary,
                        "Primary Button XL",
                        icon: ("ic_PlaceholderBlack", "ic_PlaceholderBlack")
                    )
                    
                    CKButtonView(
                        .large,
                        .tertiary,
                        "Primary Button L",
                        icon: ("", "ic_PlaceholderBlack")
                    )
                    
                    CKButtonView(
                        .medium,
                        .tertiary,
                        "Primary Button M",
                        icon: ("ic_PlaceholderBlack", "ic_PlaceholderBlack")
                    )
                    
                    CKButtonView(
                        .small,
                        .tertiary,
                        "Primary Button S",
                        icon: ("ic_PlaceholderBlack", "")
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Tertiary Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .tertiary,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    CKButtonView(
                        .large,
                        .tertiary,
                        "Primary Button L",
                        disable: true
                    )
                    
                    CKButtonView(
                        .medium,
                        .tertiary,
                        "Primary Button M",
                        disable: true
                    )
                    
                    CKButtonView(
                        .small,
                        .tertiary,
                        "Primary Button S",
                        disable: true
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ghost Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .ghost,
                        "Primary Button XL"
                    )
                    
                    CKButtonView(
                        .large,
                        .ghost,
                        "Primary Button L"
                    )
                    
                    CKButtonView(
                        .medium,
                        .ghost,
                        "Primary Button M"
                    )
                    
                    CKButtonView(
                        .small,
                        .ghost,
                        "Primary Button S"
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ghost Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    CKButtonView(
                        .extraLarge,
                        .ghost,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    CKButtonView(
                        .large,
                        .ghost,
                        "Primary Button L",
                        disable: true
                    )
                    
                    CKButtonView(
                        .medium,
                        .ghost,
                        "Primary Button M",
                        disable: true
                    )
                    
                    CKButtonView(
                        .small,
                        .ghost,
                        "Primary Button S",
                        disable: true
                    )
                }
            }
            .padding()
            .navigationTitle("Button")
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent()
    }
}
