//
//  CKButtonView.swift
//  
//
//  Created by DynamicLayers on 06/11/2023.
//

import SwiftUI

public enum ButtonSize {
    case extraLarge
    case large
    case medium
    case small
    
    var height: CGFloat {
        switch self {
        case .extraLarge:
            return 56
        case .large:
            return 48
        case .medium:
            return 40
        case .small:
            return 32
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .extraLarge, .large:
            return 12
        default:
            return 8
        }
    }
    
    var textSize: CGFloat {
        switch self {
        case .small:
            return 14
        default:
            return 16
        }
    }
}

@available(iOS 13.0, *)
public enum ButtonType {
    case primary
    case secondary
    case tertiary
    case ghost
    
    var textColor: Color {
        switch self {
        case .primary:
            return .white
        case .secondary, .ghost:
            return .purple500
        case .tertiary:
            return .platinum950
        }
    }
    
    var bgColor: Color {
        switch self {
        case .primary:
            return .purple500
        case .secondary:
            return .purple100
        case .tertiary:
            return .white
        case .ghost:
            return .clear
        }
    }
    
    var pressedTextColor: Color {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .purple500
        case .tertiary:
            return .platinum950
        case .ghost:
            return .purple700
        }
    }
    
    var pressedBgColor: Color {
        switch self {
        case .primary:
            return .purple700
        case .secondary:
            return .purple200
        case .tertiary:
            return .platinum100
        case .ghost:
            return .clear
        }
    }
    
    var disabledTextColor: Color {
        switch self {
        case .primary, .secondary, .tertiary:
            return .platinum300
        case .ghost:
            return .purple200
        }
    }
    
    var disabledBgColor: Color {
        switch self {
        case .primary, .secondary:
            return .platinum100
        default:
            return .clear
        }
    }
    
    var borderColor: Color {
        switch self{
        case .tertiary:
            return .platinum200
        default:
            return .clear
        }
    }
    
    var underline: Bool {
        switch self{
        case .ghost:
            return true
        default:
            return false
        }
    }
}

@available(iOS 13.0, *)
struct CKButtonPressEffect: ButtonStyle {
    var buttonSize: ButtonSize
    var buttonType: ButtonType
    var disable: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(disable ? buttonType.disabledTextColor : (configuration.isPressed ? buttonType.pressedTextColor : buttonType.textColor))
            .background(disable ? buttonType.disabledBgColor :  (configuration.isPressed ? buttonType.pressedBgColor : buttonType.bgColor))
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

@available(iOS 15.0.0, *)
public struct CKButtonView: View {
    
    var buttonSize: ButtonSize
    var buttonType: ButtonType
    var title: String
    var width: CGFloat
    var icon: (leadingIcon: String, trailingIcon: String)?
    var trailingButton: String?
    var disable: Bool
    var action: (()->())?
    
    public init(
        _ buttonSize: ButtonSize = .extraLarge,
        _ buttonType: ButtonType = .primary,
        _ title: String,
        width: CGFloat = .infinity,
        icon: (leadingIcon: String, trailingIcon: String)? = nil,
        disable: Bool = false,
        action: (() -> Void)? = nil
    ) {
        self.buttonSize = buttonSize
        self.buttonType = buttonType
        self.title = title
        self.width = width
        self.icon = icon
        self.disable = disable
        self.action = action
    }
    
    public var body: some View {
        Button {
            action?()
        } label: {
            HStack(spacing: 8) {
                if let leadingIcon = icon?.leadingIcon, !leadingIcon.isEmpty {
                    Image(leadingIcon)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Text(title)
                    .font(.system(size: buttonSize.textSize, weight: .bold))
                    .underline(buttonType.underline)
                
                if let trailingIcon = icon?.trailingIcon, !trailingIcon.isEmpty {
                    Image(trailingIcon)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .frame(maxWidth: width, minHeight: buttonSize.height)
        }
        .disabled(disable)
        .buttonStyle(
            CKButtonPressEffect(
                buttonSize: buttonSize,
                buttonType: buttonType,
                disable: disable
            )
        )
        .cornerRadius(buttonSize.cornerRadius)
        .overlay {
            RoundedRectangle(cornerRadius: buttonSize.cornerRadius)
                .stroke(buttonType.borderColor)
        }
    }
}
