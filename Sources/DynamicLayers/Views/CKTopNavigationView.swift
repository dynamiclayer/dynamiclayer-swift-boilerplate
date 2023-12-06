//
//  CKTopNavigationView.swift
//  
//
//  Created by DynamicLayers on 15/11/2023.
//

import SwiftUI

public enum CKTopNavigationType {
    case primary
    case primaryWithSearch
    case primaryWithProfileAvatar
    case onlySearchWithIcons
    
    var titleSize: CGFloat {
        switch self {
        case .primary,
                .primaryWithSearch,
                .onlySearchWithIcons:
            return 16
        case .primaryWithProfileAvatar:
            return 20
        }
    }
}

@available(iOS 13.0, *)
public struct CKTopNavigationParams {
    var type: CKTopNavigationType
    let title: String
    var leadingItem: AnyView?
    var trailingItem: AnyView?
    var bgColor: Color
    
    public init(
        type: CKTopNavigationType = .primaryWithSearch,
        title: String,
        leadingItem: AnyView? = nil,
        trailingItem: AnyView? = nil,
        bgColor: Color = .white
    ) {
        self.type = type
        self.title = title
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
        self.bgColor = bgColor
    }
}

@available(iOS 15.0, *)
public struct CKTopNavigationView: View {
    
    var params: CKTopNavigationParams
    @Binding var searchText: String
    var onMicPressed: (()->())?
    
    
    public init(
        params: CKTopNavigationParams,
        searchText: Binding<String>,
        onMicPressed: (()->())? = nil
    ) {
        self.params = params
        self._searchText = searchText
        self.onMicPressed = onMicPressed
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack(spacing: 0) {
                    
                    if params.type == .primaryWithProfileAvatar {
                        CKAvatarView(
                            ckAvatarSizing: .small,
                            ckAvatarBadgeType: .none
                        )
                        .padding(.horizontal, 16)
                        
                        Text(params.title)
                            .lineLimit(1)
                            .font(.system(size: params.type.titleSize, weight: .bold))
                            .foregroundColor(.platinum950)
                        
                        Spacer()
                    }
                    
                    if let leadingIItem = params.leadingItem {
                        leadingIItem
                    }
                    
                    if params.type != .primaryWithProfileAvatar {
                        Spacer()
                    }
                    
                    if let trailingItem = params.trailingItem {
                        trailingItem
                    }
                }
                
                if params.type != .primaryWithProfileAvatar {
                    HStack {
                        Spacer()
                        
                        if params.type == .onlySearchWithIcons {
                            SearchField()
                                .padding(.horizontal, 56)
                        } else {
                            Text(params.title)
                                .lineLimit(1)
                                .font(.system(size: params.type.titleSize, weight: .bold))
                                .foregroundColor(.platinum950)
                        }
                        
                        Spacer()
                    }
                }
                
            }
            .frame(height: 56)
            
            if params.type == .primaryWithSearch {
                SearchField()
                    .padding(.horizontal, 16)
            }
        }
        .background(params.bgColor)
    }
    
    func SearchField() -> some View{
        CKTextField(
            params: CKTextFieldParams(
                type: .search,
                placehlder: "Search",
                height: 40,
                isBorderExists: false
            ),
            text: $searchText,
            status: .constant(.none),
            errorString: .constant(""),
            onTrailingIconPressed: onMicPressed
        )
    }
}
