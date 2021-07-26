//
//  SwiftUIView.swift
//  fitApp

import SwiftUI

struct SwiftUIView: View {
    @State var username: String = ""
    @State var password: String = ""
        @State var isPrivate: Bool = true
        @State var notificationsEnabled: Bool = false
        @State private var previewIndex = 0
        var previewOptions = ["Always", "When unlocked", "Never"]

    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("PROFILE")) {
                        TextField("Username", text: $username)
                        TextField("Password", text: $password)
                        Toggle(isOn: $isPrivate) {
                            Text("Private Account")
                        }
                    }
                    
                    Section(header: Text("NOTIFICATIONS")) {
                        Toggle(isOn: $notificationsEnabled) {
                            Text("Enabled")
                        }
                        Picker(selection: $previewIndex, label: Text("Show Previews")) {
                            ForEach(0 ..< previewOptions.count) {
                                Text(self.previewOptions[$0])
                            }
                        }
                    }
                    
                    Section(header: Text("ABOUT")) {
                        HStack {
                            Text("Version")
                            Spacer()
                            Text("2.2.1")
                        }
                    }
                    
                    Section {
                        Button(action: {
                            print("Perform an action here...")
                        }) {
                            Text("Reset All Settings")
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
        }
    }



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
