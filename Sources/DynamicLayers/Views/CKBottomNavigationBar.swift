//
//  CKBottomNavigationBar.swift
//  
//
//  Created by DynamicLayers on 09/11/2023.
//


import SwiftUI

public struct CKBottomItem {
    let id = UUID().uuidString
    let title: String
    let icon: String
    var badgeType: CKNotificationBadgeType?
    var notiCount: Int?
    
    public init(
        title: String,
        icon: String,
        badgeType: CKNotificationBadgeType? = nil,
        notiCount: Int? = nil
    ) {
        self.title = title
        self.icon = icon
        self.badgeType = badgeType
        self.notiCount = notiCount
    }
    
    public func getXOffset() -> CGFloat {
        if badgeType == .small {
            return 6
        } else {
            if notiCount ?? 0 < 10 {
                return 10
            } else if notiCount ?? 0 > 10{
                return 12
            }else if notiCount ?? 0 > 99{
                return 24
            } else {
                return 6
            }
        }
    }
}

@available(iOS 15.0, *)
public struct CKBottomNavigationBar: View {
    
    let items: [CKBottomItem]
    @Binding var selectedIndex: Int
    
    public init(items: [CKBottomItem], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
    }
    
    public var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: items.count)) {
            ForEach((0..<items.count), id: \.self){ index in
                TabItem(item: items[index], isSelected: selectedIndex == index){
                    selectedIndex = index
                }
            }
        }
        .padding(.top, 6)
        .border(width: 1, edges: [.top], color: Color.platinum200)
        .frame(height: 64)
    }
    
    func TabItem(item: CKBottomItem, isSelected: Bool, action: @escaping (()->())) -> some View {
        VStack(spacing: 8) {
            ZStack {
                Image(item.icon)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                
                if let badgeType = item.badgeType {
                    CKNotificationBadgeView(type: badgeType, notiCount: item.notiCount)
                        .offset(x: item.getXOffset(), y: -6)
                }
                
            }
            Text(item.title)
                .font(.system(size: 12, weight: .bold))
        }
        .foregroundColor(isSelected ? .platinum950 : .platinum400)
        .padding(.horizontal, 8)
        .onTapGesture {
            withAnimation {
                action()
            }
        }
    }
}
