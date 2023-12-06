//
//  CKTopNavigationComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 15/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKTopNavigationComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            CKTopNavigationView(
                params: CKTopNavigationParams(
                    type: .primary,
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
            
            CKTopNavigationView(
                params: CKTopNavigationParams(
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
            
            CKTopNavigationView(
                params: CKTopNavigationParams(
                    type: .onlySearchWithIcons,
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
            
            CKTopNavigationView(
                params: CKTopNavigationParams(
                    type: .primaryWithProfileAvatar,
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
        }
        .navigationTitle("Toggle")
        .padding()
        .background(.gray)
    }
}

struct CKTopNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        CKTopNavigationComponent()
    }
}
