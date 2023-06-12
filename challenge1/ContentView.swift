//
//  ContentView.swift
//  challenge1
//
//  Created by Muhammad Faisal Imran Khan on 11/6/23.
//

import SwiftUI


struct ContentView: View {
    
    
    @State private var amount = 0.0
    @State private var inputType = 0
    @State private var outputType = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
   var convertedValue: Double {
        if( inputType == outputType ){
            return amount
        }
        else {
            if(inputType == 0 && outputType == 1){
                return amount / 1000
            }
            else if(inputType == 1 && outputType == 0){
                return amount * 1000
            }
            else if(inputType == 0 && outputType == 2){
                return amount * 3.28
            }
            else if(inputType == 2 && outputType == 0){
                return amount / 3.28
            }
            else if(inputType == 1 && outputType == 2){
                return amount * 3280
            }
            else {
                return amount / 3280
            }
            
            
            
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .number)
                        .keyboardType(.decimalPad)

                    Picker("InputType", selection: $inputType) {
                                    Text("meter").tag(0)
                                    Text("kilometer").tag(1)
                                    Text("feet").tag(2)
                                   
                                }
                                .pickerStyle(.segmented)

                    Picker("OutputType", selection: $outputType) {
                                    Text("meter").tag(0)
                                    Text("kilometer").tag(1)
                                    Text("feet").tag(2)
                                   
                                }
                                .pickerStyle(.segmented)
                  
                    Text(convertedValue, format: .number)
                
                    
                }
               
            }
        }
        .navigationTitle("Converter")
        .toolbar {
           
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
