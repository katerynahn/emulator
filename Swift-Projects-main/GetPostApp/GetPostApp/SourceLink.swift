//
//  SourceLink.swift
//  GetPostApp
//

import SwiftUI

struct SourceLink: View {

    @State var domainStr = "ngrok.io"
    @State private var linkStr = "https://2f516570ffbb"
    var body: some View {
        NavigationView{
            HStack{
                List{
                    TextField("domain", text: $domainStr)
                    TextField("link", text: $linkStr)
                }.listStyle(DefaultListStyle())
            } .navigationBarTitle("Settings")
        }
    }
}

struct SourceLink_Previews: PreviewProvider {
    static var previews: some View {
        SourceLink()
    }
}
