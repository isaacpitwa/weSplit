//
//  ContentView.swift
//  WeSplit
//
//  Created by isaacpitwa on 28/02/2022.
//

import SwiftUI

struct ContentView: View {
    let students = ["Isaac","Pitwa","Nonyi","Zack","Atama","Harry"]
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var name = ""
    @State private var selectedStudent = "Harry"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100  * tipSelection;
        let grandTotal = checkAmount + tipValue;
        let amountPerPerson = grandTotal/peopleCount;
        return amountPerPerson;
    }
    
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Enter your Name",text: $name)
                Text("Your name is \(name)")
                Section{
                    Text("View using Loops")
                    Picker("select Student", selection: $selectedStudent){
                        ForEach(students, id:\.self){
                            Text($0)
                        }
                    }
                }
                Section {
                       TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    Picker("Number of People",selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                   }
                Section {
//                    Text("How much tip do you want to leave?")
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }

                   Section {
                       Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad)
                   }
            }.navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
