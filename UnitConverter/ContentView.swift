//
//  ContentView.swift
//  UnitConverter
//
//  Created by Renzo Daal on 14/04/2023
//
//
//

import SwiftUI

struct ContentView: View
{
    @State private var firstUnit = "Seconds"
    @State private var secondUnit = "Seconds"
    @State private var inputAmount = 0
    
    let units = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedUnit: Double
    {
        var tempUnit = Double(inputAmount)
        
        if(firstUnit == "Minutes"){tempUnit *= 60}
        else if(firstUnit == "Hours"){tempUnit *= 3600}
        else if(firstUnit == "Days"){tempUnit *= 86400}
        
        if(secondUnit == "Minutes"){return tempUnit / 60}
        else if(secondUnit == "Hours"){return tempUnit / 3600}
        else if(secondUnit == "Days"){return tempUnit / 86400}
        else{return tempUnit}
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    Picker("From", selection: $firstUnit)
                    {
                        ForEach(units, id: \.self){Text($0)}
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Amount", value: $inputAmount, format: .number)
                    
                }
                header:{Text("From")}
                
                Section
                {
                    Picker("From", selection: $secondUnit)
                    {
                        ForEach(units, id: \.self){Text($0)}
                    }
                    .pickerStyle(.segmented)
                    
                    Text(convertedUnit, format: .number)
                }
                header:{Text("To")}
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("UnitConverter")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
