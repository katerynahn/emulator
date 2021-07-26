//
//  ContentView.swift
//  Tips_calc


import SwiftUI



struct ContentView: View {
    
    @State private var numberOfPeople = 2
    @State private var checkAmount = ""
    @State private var tipPercentage = 0
    
    let tipPercentages = [0,5,10,15,20,25]
    var totalPerPerson: Double {
        let _checkAmount = Double(checkAmount) ?? 0
        let perPersonNoTip = _checkAmount / Double(numberOfPeople + 2)
        let _tip = perPersonNoTip / 100 * Double(tipPercentages[tipPercentage])
        let addTip = perPersonNoTip + _tip
        return addTip
    }
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Enter check amount: ", text: $checkAmount)
                    Picker(selection: $numberOfPeople, label: Text("Amount of people")){
                        ForEach(2..<100){
                            Text("\($0)")
                        }
                    }.pickerStyle(DefaultPickerStyle())
                }
                
                Section(header: Text("select tip")){
                    Picker(selection: $tipPercentage, label: Text("Select tip amount")){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Final tip")){
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
                
                
            }
            .navigationBarTitle("Tips Calculator")
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
