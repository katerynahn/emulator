//
//  MainPage.swift
//  GetPostApp


import SwiftUI
struct MainPage: View {
    let a = ContenView()
    let b = SourceLink()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink(destination: a){
                        Text("register")
                    }
                    NavigationLink(destination: LoginReq()){
                        Text("login")
                    }
                }
                NavigationLink(destination: SourceLink()){
                    Text("settings")
                }
                .navigationBarTitle("Navigation")
                
            }
            
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
