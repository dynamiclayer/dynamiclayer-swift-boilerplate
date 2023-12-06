//
//  BottomNavigationBarComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct BottomNavigationBarComponent: View {
    
    @State var selectedIndex1 = 0
    let items1: [CKBottomItem] = [
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .small),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .medium, notiCount: 2)
    ]
    
    @State var selectedIndex2 = 0
    let items2: [CKBottomItem] = [
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 100),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack")
    ]
    
    @State var selectedIndex3 = 0
    let items3: [CKBottomItem] = [
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 100),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack")
    ]
    
    @State var selectedIndex4 = 0
    let items4: [CKBottomItem] = [
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 22),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        CKBottomItem(title: "Label", icon: "ic_PlaceholderBlack")
    ]
    
    var body: some View {
        VStack(spacing: 40) {
            CKBottomNavigationBar(items: items1, selectedIndex: $selectedIndex1)
            CKBottomNavigationBar(items: items2, selectedIndex: $selectedIndex2)
            CKBottomNavigationBar(items: items3, selectedIndex: $selectedIndex3)
            CKBottomNavigationBar(items: items4, selectedIndex: $selectedIndex4)
            
            Spacer()
        }
        .navigationTitle("Bottom Navigation Bar")
        .padding(.vertical)
    }
}

struct BottomNavigationBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBarComponent()
    }
}
