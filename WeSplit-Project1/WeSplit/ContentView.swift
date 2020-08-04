//
//  ContentView.swift
//  WeSplit
//
//  Created by Lauren Kwee on 7/25/20.
//  Copyright © 2020 Lauren Kwee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    var tipIsZero: Bool{
        return tipPercentage == 5
    }
    
    let tipPercentages = [5, 10, 15, 20, 25, 0]
    
    var grandTotal: Double{
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipTotal = tipSelection * orderAmount / 100
        let grandTotal = tipTotal + orderAmount
        
        return grandTotal
    }
        
    var totalPerPerson: Double{
        if Double(numberOfPeople) == 0 {
            return 0
        }
        
        else if Double(grandTotal) == 0 {
            return 0
        }
        else{
            let peopleCount = Double(numberOfPeople) ?? 0
            let amountPerPerson = Double (grandTotal / peopleCount)
            
            return amountPerPerson
        }
        }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople).keyboardType(.decimalPad)
                }
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("", selection: $tipPercentage){
                        ForEach (0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                    }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Grand Total")){
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipIsZero ? .red: .black)
                }
                Section(header: Text("Total per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
