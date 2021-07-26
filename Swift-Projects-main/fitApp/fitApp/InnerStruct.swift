//
//  InnerStruct.swift
//  fitApp
//

import SwiftUI
class foodParams: ObservableObject {
    @Published var name = ""
    @Published var selectedFood = 0
    var foodTypes = ["proteins", "fats", "carbohydrates"]
    @Published var foodWeight = ""
    @Published var typeOf_ = ""
    @Published var amountOf_ = 0
    @Published var calories : Double = 0
    @Published var safeCalories : Double = 0
}
struct InnerStruct: View {
    @ObservedObject var foodParam = foodParams()
    func calCounter() {
    if Double(foodParam.foodWeight) != nil {
        foodParam.safeCalories = Double(foodParam.foodWeight)!
    }
        if foodParam.selectedFood == 0 || foodParam.selectedFood == 2 {
            foodParam.calories = foodParam.safeCalories * 4 * Double(foodParam.amountOf_)
        } else {
            foodParam.calories = foodParam.safeCalories * 9 * Double(foodParam.amountOf_)
        }
    }
    var body: some View {
        NavigationView {
            
                Form {
                    Section(header: Text("food info")){
                Picker(selection: $foodParam.selectedFood, label: Text("Choose type of food")){
                    ForEach(0..<foodParam.foodTypes.count) {
                        element in Text(self.foodParam.foodTypes[element])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                TextField("Enter food name", text: $foodParam.name)
                TextField("Enter food weight", text: $foodParam.foodWeight)
                    Stepper("Enter amount of times you ate this food", onIncrement: {
                        self.foodParam.amountOf_ += 1
                    }, onDecrement: {
                        self.foodParam.amountOf_ -= 1
                    })
                    Text("\(foodParam.amountOf_)")
                    TextField("What part of the day is it?", text: $foodParam.typeOf_)
                    }
                    Section(header: Text("calories")){
                        Text("You recieved: \(Int(foodParam.calories)) calories")
                        Button(action:{calCounter()}){
                            Text("Calculate")
                                .multilineTextAlignment(.center)
                        }.buttonStyle(DefaultButtonStyle()).frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                
                
            
            .navigationBarTitle("Your food")
        }
    }
}

struct InnerStruct_Previews: PreviewProvider {
    static var previews: some View {
        InnerStruct()
    }
}
