//
//  ContentView.swift
//  Unit Converter
//
//  Created by Faizaan Khan on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0
    @State private var inputUnit = "Minutes"
    @State private var outputUnit = "Seconds"
    @FocusState private var inputFocused: Bool
        
    let timeUnits: [String] = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedOutput: Double{
        let input = Double(inputNumber)
        var inputInSeconds: Double{
            switch(inputUnit){
            case ("Seconds"):
                return input
            case("Minutes"):
                return input * 60
            case("Hours"):
                return input * (60*60)
            case("Days"):
                return input * (24 * 60 * 60)
            default:
                return 0
            }
        }
        
        var convertedOutput: Double{
            switch(outputUnit){
            case("Seconds"):
                return inputInSeconds
            case("Minutes"):
                return inputInSeconds / 60
            case("Hours"):
                return inputInSeconds / (60*60)
            case("Days"):
                return inputInSeconds / (24*60*60)
            default:
                return 0
            }
        }
        
        return convertedOutput
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter the number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFocused)
                    
                    Picker("Input Unit", selection:$inputUnit){
                        ForEach(timeUnits, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .keyboardType(.decimalPad)
                } header: {
                    Text("The unit you want to convert")
                }
                
                Section{
                    Picker("Output unit", selection: $outputUnit){
                        ForEach(timeUnits, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                } header: {
                    Text("Output")
                }
                
                Section{
                    Text("\(String(format: "%.2f", convertedOutput)) \(outputUnit)")
                } header: {
                    Text("Ouptut value")
                }
            }
            .navigationTitle("Time Converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        inputFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
