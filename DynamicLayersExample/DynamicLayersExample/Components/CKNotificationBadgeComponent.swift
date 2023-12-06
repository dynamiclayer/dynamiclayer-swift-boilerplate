//
//  CKNotificationBadgeComponent.swift
//  CraftKitExample
//
//  Created by Muhammad Abbbas on 11/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKNotificationBadgeComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            CKNotificationBadgeView(type: .small, notiCount: nil)
            CKNotificationBadgeView(type: CKNotificationBadgeType.medium, notiCount: 3)
            CKNotificationBadgeView(type: CKNotificationBadgeType.large, notiCount: 100)
            CKNotificationBadgeView(type: CKNotificationBadgeType.secondary, notiCount: nil)
        }
        .navigationTitle("Notification Badge")
        .padding()
        .background {
            Color
                .gray
        }
    }
}

struct CKNotificationBadge_Previews: PreviewProvider {
    static var previews: some View {
        CKNotificationBadgeComponent()
    }
}
