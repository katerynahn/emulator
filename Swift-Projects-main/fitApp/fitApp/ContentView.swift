//
//  ContentView.swift
//  fitApp
//

import SwiftUI

struct ContentView: View {
    @State private var str = ""
    var body: some View {
        TabView {
            yourWeight()
                .tabItem {
                    Image(systemName: "scalemass.fill")
                    Text("Your weight")
                }.tag(/*@START_MENU_TOKEN@*/"Tag"/*@END_MENU_TOKEN@*/)
            YourFood()
                .tabItem {
                    Image(systemName: "heart.text.square")
                    Text("Your food")
                }.tag(/*@START_MENU_TOKEN@*/"Tag"/*@END_MENU_TOKEN@*/)
            SwiftUIView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }.tag(/*@START_MENU_TOKEN@*/"Tag"/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
