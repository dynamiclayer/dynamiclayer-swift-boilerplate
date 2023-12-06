//
//  CKTextFieldComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 15/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKTextFieldComponent: View {
    
    @State var text0 = ""
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""
    @State var text5 = ""
    @State var status1: CKTextFieldStatus = .none
    @State var status2: CKTextFieldStatus = .warning
    @State var status3: CKTextFieldStatus = .info
    @State var status4: CKTextFieldStatus = .error
    @State var status5: CKTextFieldStatus = .success
    
    var body: some View {
        VStack(spacing: 20) {
            CKTextField(
                params: CKTextFieldParams(
                    type: .search,
                    placehlder: "Search",
                    isBorderExists: false
                ),
                text: $text0,
                status: .constant(.none),
                errorString: .constant("")
            )
            CKTextField(
                params: CKTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text1,
                status: $status1,
                errorString: .constant("")
            )
            CKTextField(
                params: CKTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text2,
                status: $status2,
                errorString: .constant("")
            )
            CKTextField(
                params: CKTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text3,
                status: $status3,
                errorString: .constant("")
            )
            CKTextField(
                params: CKTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text4,
                status: $status4,
                errorString: .constant("* Description")
            )
            CKTextField(
                params: CKTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text5,
                status: $status5,
                errorString: .constant("")
            )
            
        }
        .navigationTitle("Toggle")
        .padding()
    }
}

struct CKTextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        CKTextFieldComponent()
    }
}
