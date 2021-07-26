//
//  yourWeight.swift
//  fitApp


import SwiftUI
class Params: ObservableObject {
    @Published var yourWeight = ""
    @Published var yourHeight = ""
    @Published var yourCondition = ""
    @Published var expectedWeight : Double = 0
    @Published var showInfo = false
    @Published var countedProp : Double = 0
    @Published var safeHeight : Double = 0
    @Published var safeWeight : Double = 0
    @Published var yourAge: Double = 20
}
struct yourWeight: View {
    @ObservedObject var params = Params()
    func counter(){
        if Double(params.yourHeight) != nil {
            params.safeHeight = Double(params.yourHeight)!
        }
        if Double(params.yourWeight) != nil {
            params.safeWeight = Double(params.yourWeight)!
        }
        params.countedProp = params.safeWeight / (params.safeHeight * params.safeHeight * 0.0001 )
        if params.countedProp >= 18 && params.countedProp <= 25 {
            params.yourCondition = "normal"
        } else if params.countedProp < 18 {
            params.yourCondition = "under weight"
        } else {
            params.yourCondition = "over weight"
        }
        params.expectedWeight = params.safeHeight * params.safeHeight * 0.0001 * 27
    }
    var body: some View {
        
        ZStack{
            
            VStack{
                
                Text("Control your weight")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .padding()
                Form{
                    Section(header: Text("Data enter")){
                Text("Enter your weight (kg): ")
                    
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("0.00",text: $params.yourWeight)
                    
                Text("Enter your height (cm): ")
                    
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("0.00",text: $params.yourHeight)
                    
                        Text("Enter your age: ")
                            
                        Slider(value: $params.yourAge, in:0...100, step: 1)
                        Text("\(Int(params.yourAge))")
                           
                    }
                    Section(header: Text("Results")){
                    Text("Your condtion is :\(params.yourCondition)").padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .animation(.default)
                    Text("Expected weight: \(Int(params.expectedWeight))")
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .animation(.default)
                    }
                    Section {
                        Button(action:{counter()}){
                            Text("Calculate")
                                .multilineTextAlignment(.center)
                                
                        }.buttonStyle(DefaultButtonStyle()).frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            
        }
    }
}

struct yourWeight_Previews: PreviewProvider {
    static var previews: some View {
        yourWeight()
    }
}
