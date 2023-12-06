//
//  ContentView.swift
//  DynamicLayersExample
//
//  Created by DynamicLayers on 16/11/2023.
//

import SwiftUI
import DynamicLayers

struct Widget {
    let id = UUID().uuidString
    let destinationView: AnyView
    let label: AnyView
}

struct ContentView: View {
    
    let freeWidgets: [Widget] = [
        Widget(
            destinationView: AnyView(ButtonComponent()),
            label: AnyView(Text("1.  Button"))
        ),
        Widget(
            destinationView: AnyView(BottomNavigationBarComponent()),
            label: AnyView(Text("2.  Bottom Navigation Bar"))
        ),
        Widget(
            destinationView: AnyView(CKNotificationBadgeComponent()),
            label: AnyView(Text("3.  Notification Badge"))
        ),
        Widget(
            destinationView: AnyView(CKTextFieldComponent()),
            label: AnyView(Text("4.  Text Field"))
        ),
        Widget(
            destinationView: AnyView(CKTopNavigationComponent()),
            label: AnyView(Text("5.  Top Navigation"))
        )
    ]
    
    let paidWidgets: [Widget] = [
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Card")),
            label: AnyView(Text("1.  Card"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Chip")),
            label: AnyView(Text("2.  Chip"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Line Item")),
            label: AnyView(Text("3.  Line Item"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Menu")),
            label: AnyView(Text("4.  Menu"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Message")),
            label: AnyView(Text("5.  Message"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Segment Control")),
            label: AnyView(Text("6.  Segment Control"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Tab Control")),
            label: AnyView(Text("7.  Tab Control"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Toggle")),
            label: AnyView(Text("8.  Toggle"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Coach Mark")),
            label: AnyView(Text("9.  Coach Mark"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Icon Button")),
            label: AnyView(Text("10.  Icon Button"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Notification")),
            label: AnyView(Text("11.  Notification"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Page Indicator")),
            label: AnyView(Text("12.  Page Indicator"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Tooltip")),
            label: AnyView(Text("13.  Tooltip"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Avatar")),
            label: AnyView(Text("14.  Avatar"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Badge")),
            label: AnyView(Text("15.  Badge"))
        ),
        Widget(
            destinationView: AnyView(PaidComponentView(title: "Bottom Sheet")),
            label: AnyView(Text("16.  Bottom Sheet"))
        ),
    ]
    
    var body: some View {
        NavigationStack{
            List{
                Section {
                    ForEach(freeWidgets, id: \.id) { widget in
                        NavigationLink {
                            widget.destinationView
                        } label: {
                            widget.label
                        }
                        
                    }
                } header: {
                    Text("Free Components")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.vertical, 4)
                }
                
                Section {
                    ForEach(paidWidgets, id: \.id) { widget in
                        NavigationLink {
                            widget.destinationView
                        } label: {
                            widget.label
                        }
                        
                    }
                } header: {
                    Text("Paid Components")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.vertical, 4)
                }
            }
            .navigationTitle("Dynamic Layers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
