//
//  YourFood.swift
//  fitApp


import SwiftUI
struct Items: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
class Expenses: ObservableObject {
    @Published var items = [Items]()

}

struct YourFood: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(expenses.items) { item in
                    NavigationLink(destination: InnerStruct()) {
                        Text(item.name)
                    }
                }
                .onDelete(perform: removeItems)
            }.listStyle(InsetListStyle())
            .navigationBarTitle("Food manager")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        let expenses = Items( name: "New food", type: "", amount: 20)
                        self.expenses.items.append(expenses)
                        
                    },
                    label: {
                        Image(systemName: "plus")
                    }))
        }
    }
    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct YourFood_Previews: PreviewProvider {
    static var previews: some View {
        YourFood()
    }
}
