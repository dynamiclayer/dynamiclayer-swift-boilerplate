//
//  CKTextField.swift
//
//
//  Created by DynamicLayers on 15/11/2023.
//

import SwiftUI

@available(iOS 13.0, *)
public enum CKTextFieldType {
    case primary
    case search
    
    var bgColor: Color {
        switch self {
        case .primary:
            return .white
        case .search:
            return .platinum50
        }
    }
    
    var focusedBgColor: Color {
        switch self {
        case .primary:
            return .white
        case .search:
            return .platinum100
        }
    }
}

public enum CKTextFieldStatus {
    case info
    case warning
    case success
    case error
    case none
    
    var icon: String {
        switch self {
        case .info:
            return "ic_Info"
        case .warning:
            return "ic_AlertTriangle"
        case .success:
            return "ic_Success"
        case .error:
            return "ic_Error"
        case .none:
            return ""
        }
    }
}

@available(iOS 13.0, *)
public struct CKTextFieldParams {
    var type: CKTextFieldType
    var placehlder: String
    var height: CGFloat
    var isBorderExists: Bool
    
    public init(
        type: CKTextFieldType = .primary,
        placehlder: String,
        height: CGFloat = 56,
        isBorderExists: Bool = true
    ) {
        self.type = type
        self.placehlder = placehlder
        self.height = height
        self.isBorderExists = isBorderExists
    }
}

@available(iOS 15.0, *)
public struct CKTextField: View {
    
    var params: CKTextFieldParams
    @Binding var text: String
    @Binding var status: CKTextFieldStatus
    @Binding var errorString: String
    var onTrailingIconPressed: (() -> ())?
    
    @FocusState var focused: Bool
    
    public init(
        params: CKTextFieldParams,
        text: Binding<String>,
        status: Binding<CKTextFieldStatus>,
        errorString: Binding<String>,
        onTrailingIconPressed: (()->())? = nil
    ) {
        self.params = params
        self._text = text
        self._status = status
        self._errorString = errorString
        self.onTrailingIconPressed = onTrailingIconPressed
    }
    
    public var body: some View {
        let isError = (params.type == .primary && status == .error)
        let isActive = focused || text.count > 0
        
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                if params.type == .search {
                    Image(uiImage: UIImage(named: "ic_Search", in: .module, with: nil)!)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                ZStack(alignment: isActive ? .topLeading : .center) {
                    
                    if params.type == .search {
                        TextField("", text: $text)
                            .foregroundColor(.platinum950)
                            .frame(height: 24)
                            .font(.system(size: 16, weight: .regular))
                            .placeholder(when: text.isEmpty) {
                                Text(params.placehlder)
                                    .foregroundColor(.gray)
                            }
                            .focused($focused)
                    } else {
                        TextField("", text: $text)
                            .foregroundColor(.platinum950)
                            .frame(height: 24)
                            .font(.system(size: 16, weight: .regular))
                            .placeholder(when: text.isEmpty) {
                                Text(params.placehlder)
                                    .foregroundColor(.gray)
                            }
                            .opacity(isActive ? 1 : 0)
                            .offset(y: 7)
                            .focused($focused)
                        
                        HStack {
                            Text(params.placehlder)
                                .foregroundColor(isError ? .red : .platinum500)
                                .frame(height: 16)
                                .font(.system(size: isActive ? 12 : 16, weight: .regular))
                                .offset(y: isActive ? -7 : 0)
                            Spacer()
                        }
                    }
                }
                .animation(.linear, value: focused)
                
                Spacer()
                
                Button {
                    onTrailingIconPressed?()
                } label: {
                    if params.type == .primary {
                        if !status.icon.isEmpty {
                            Image(uiImage: UIImage(named: status.icon, in: .module, with: nil)!)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    } else {
                        Image(uiImage: UIImage(named: "ic_Microphone", in: .module, with: nil)!)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .frame(height: params.height)
            .padding(.horizontal, 16)
            .background(focused ? params.type.focusedBgColor : params.type.bgColor)
            .cornerRadius(12)
            .overlay {
                if params.isBorderExists {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(focused ? Color.grey400 : Color.grey200)
                }
            }
            .onTapGesture {
                focused = true
            }
            
            if !errorString.isEmpty {
                Text(errorString)
                    .foregroundColor(.red)
                    .frame(height: 24)
                    .font(.system(size: 16, weight: .regular))
            }
        }
    }
}

@available(iOS 13.0, *)
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading
    ) -> some View {
        
        placeholder(when: shouldShow, alignment: alignment) {
            Text(text)
                .foregroundColor(.platinum500)
        }
    }
}
