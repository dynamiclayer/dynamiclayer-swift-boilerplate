//
//  CKAvatarView.swift
//  
//
//  Created by DynamicLayers on 05/11/2023.
//

import SwiftUI

public enum CKAvatarSizing: CGFloat {
    /// Extra small spacing
    case extraSmall = 4
    /// Small spacing
    case small = 8
    /// Medium spacing
    case medium = 12
    /// Large spacing
    case large = 16
    
    /// Badge size for avatar
    var badgeSize: CGFloat {
        switch self {
        case .extraSmall:
            return 12
        case .small:
            return 14
        case .medium:
            return 16
        case .large:
            return 18
        }
    }
    
    /// Badge text size
    var badgeTextSize: CGFloat {
        switch self {
        case .extraSmall, .small:
            return 8
        case .medium, .large:
            return 12
        }
    }
}

@available(iOS 13.0.0, *)
public enum CKAvatarBadgeType: Equatable {
    case online
    case offline
    case notificationIndicator
    case notificationIndicatorWith(count: Int)
    case notificationIndicatorWithIcon(icon: String)
    case none
    
    var bgColor: Color {
        switch self {
        case .online,
                .notificationIndicator,
                .notificationIndicatorWith,
                .notificationIndicatorWithIcon,
                .none:
            return .green500
        case .offline:
            return .grey200
        }
    }
}

@available(iOS 15.0.0, *)
public struct CKAvatarBadgeView: View {
    
    var ckAvatarSizing: CKAvatarSizing
    var ckAvatarBadgeType: CKAvatarBadgeType
    
    public init(
        ckAvatarSizing: CKAvatarSizing,
        ckAvatarBadgeType: CKAvatarBadgeType
    ) {
        self.ckAvatarSizing = ckAvatarSizing
        self.ckAvatarBadgeType = ckAvatarBadgeType
    }
    
    public var body: some View {
        Circle()
            .fill(ckAvatarBadgeType.bgColor)
            .frame(width: ckAvatarSizing.badgeSize, height: ckAvatarSizing.badgeSize)
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 2)
            }
            .overlay {
                switch ckAvatarBadgeType {
                case .notificationIndicator:
                    Circle()
                        .fill(.white)
                        .frame(width: ckAvatarSizing.badgeSize/4, height: ckAvatarSizing.badgeSize/4)
                case .notificationIndicatorWith(let count):
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.system(size: ckAvatarSizing.badgeTextSize, weight: .bold))
                case .notificationIndicatorWithIcon(icon: let icon):
                    Image(icon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: ckAvatarSizing.badgeSize - 8, height: ckAvatarSizing.badgeSize - 8)
                default: Text("")
                }
            }
    }
}

@available(iOS 15.0.0, *)
public struct CKAvatarView: View {
    
    var ckAvatarSizing: CKAvatarSizing
    var ckAvatarBadgeType: CKAvatarBadgeType
    var action: (()->())?
    
    public init(
        ckAvatarSizing: CKAvatarSizing = .large,
        ckAvatarBadgeType: CKAvatarBadgeType = .online,
        action: (()->())? = nil
    ) {
        self.ckAvatarSizing = ckAvatarSizing
        self.ckAvatarBadgeType = ckAvatarBadgeType
        self.action = action
    }
    
    public var body: some View {
        Image(uiImage: UIImage(named: "ic_User", in: .module, with: nil)!)
            .resizable()
            .frame(width: 24, height: 24)
            .padding(ckAvatarSizing.rawValue)
            .overlay {
                Circle()
                    .stroke(Color.grey200)
            }
            .overlay(alignment: .bottomTrailing) {
                if ckAvatarBadgeType != CKAvatarBadgeType.none {
                    CKAvatarBadgeView(
                        ckAvatarSizing: ckAvatarSizing,
                        ckAvatarBadgeType: ckAvatarBadgeType
                    )
                    .offset(x: 3, y: 3)
                }
            }
            .onTapGesture {
                action?()
            }
    }
}
