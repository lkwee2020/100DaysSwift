//
//  ContentView.swift
//  Conversions
//
//  Created by Lauren Kwee on 7/29/20.
//  Copyright © 2020 Lauren Kwee. All rights reserved.
//

import SwiftUI

func convertToC(oldTemp: Double, oldUnit: Int) -> Double {
    // covert to C
    if oldUnit == 1
    {
        //done
        return oldTemp
    }
    if oldUnit == 0{
        return Double((oldTemp - 32)*5/9)
    }
    
    else {
        return oldTemp - 273
        }
    //"New unit and old unit cannot be the same"
}

//create function that converts from C to others
func convertFromC(oldTempInC: Double, newUnit: Int) -> Double{
    if newUnit == 1
    {
        //done
        return oldTempInC
    }
    if newUnit == 0 {
        return Double((oldTempInC * 9 / 5 + 32))
    }
    
    else {
        return oldTempInC + 273
        }
}

struct ContentView: View {
    @State private var currentTemperature = ""
    @State private var currentUnit = 0
    @State private var newUnit = 0
    let units = ["°F", "°C", "K"]
    
    //math conversions for temperature

    var currentTempDouble: Double{
        return Double(currentTemperature) ?? 0
    }

    var tempConvertedToC: Double{
        return convertToC(oldTemp: currentTempDouble, oldUnit: currentUnit)
    }
    
    var tempConvertedNewUnit: Double{
        return convertFromC(oldTempInC: tempConvertedToC, newUnit: newUnit)
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack{
                        TextField("Current temperature", text: $currentTemperature).keyboardType(.decimalPad)
                    Picker("Current Unit", selection: $currentUnit){
                        ForEach (0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section(header: Text("New temperature unit")){
                    Picker("New unit", selection: $newUnit){
                    ForEach (0 ..< units.count){
                        Text("\(self.units[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
                Section(header: Text("New converted temperature")){
                    Text("\(tempConvertedNewUnit, specifier: "%.1f") \(self.units[newUnit])")
                }
            .navigationBarTitle("Celsius Converter").font(.system(size: 15))
    }
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
