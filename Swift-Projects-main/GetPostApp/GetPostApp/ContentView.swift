///


import SwiftUI


struct ContenView: View {
    @State private var urlRequset_ = ""
    @State private var emailRequest = ""
    @State private var nameRequest = ""
    @State private var bodyRequest = ["email":"","fullName":"","password":""]
    @State private var passwordReq = ""
    func registration() {
        let defaulturl = URL(string: "HTTP://")
        let request2 = URL(string: urlRequset_) ?? defaulturl!
        var request = URLRequest(url: request2)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        bodyRequest = ["email":emailRequest,"fullName":nameRequest ,"password":passwordReq]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: bodyRequest,
            options: []
        )
        request.httpMethod = "POST"
        request.httpBody = bodyData
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
                // Handle HTTP request error
            } else if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")    } else {
                    // Handle unexpected error
                }
        }
        task.resume()
        
    }
    var body: some View {
        NavigationView{
            VStack{
                List {
                    
                    TextField("Enter email", text: $emailRequest)
                    //Text(emailRequest)
                    TextField("Enter name", text: $nameRequest)
                    //Text(nameRequest)
                    TextField("Enter password", text: $passwordReq)
                    //Text(passwordReq)
                }.listStyle(GroupedListStyle())
                
                Button(action: {registration()}){
                    Text("Register")
                }.buttonStyle(BorderlessButtonStyle())
                
                .navigationBarTitle("Register")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContenView()
    }
}

