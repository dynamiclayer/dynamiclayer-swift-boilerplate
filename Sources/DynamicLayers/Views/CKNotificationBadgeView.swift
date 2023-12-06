//
//  CKNotificationBadgeView.swift
//  
//
//  Created by DynamicLayers on 11/11/2023.
//

import SwiftUI

public enum CKNotificationBadgeType {
    case small
    case medium
    case large
    case secondary
    
    var size: CGFloat {
        switch self {
        case .small:
            return 10
        case .medium,
                .large,
                .secondary:
            return 18
        }
    }
}

@available(iOS 15.0.0, *)
public struct CKNotificationBadgeView: View {
    
    var type: CKNotificationBadgeType
    var notiCount: Int?
    
    public init(
        type: CKNotificationBadgeType = .large,
        notiCount: Int?
    ) {
        self.type = type
        self.notiCount = notiCount
    }
    
    public var body: some View {
        if type == .medium || type == .large {
            if let notiCount{
                Text("\(notiCount)")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 4)
                    .frame(minWidth: 18, maxHeight: 18)
                    .background(.red)
                    .cornerRadius(30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                    }
            }
        } else {
            Circle()
                .fill(.red)
                .frame(width: type.size, height: type.size)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                }
                .overlay {
                    if type == .secondary {
                        Circle()
                            .fill(.white)
                            .frame(width: 5.33, height: 5.33)
                    }
                }
        }
    }
}
