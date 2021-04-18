//
//  ContentView.swift
//  Conversions
//
//  Created by Pranav Kasetti on 21/11/2020.
//

import SwiftUI

struct ContentNewView: View {

  let units = [UnitVolume.milliliters,
               UnitVolume.liters,
               UnitVolume.cups,
               UnitVolume.pints,
               UnitVolume.gallons]

  @State var inputUnit = 0
  @State var outputUnit = 1
  @State var value: String = ""

  var converted: Double {
    let baseInput = units[inputUnit].converter.baseUnitValue(fromValue: Double(value) ?? 0)
    let output = units[outputUnit].converter.value(fromBaseUnitValue: baseInput)
    return output
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Enter amount to convert")) {
          TextField("Enter amount", text: $value)
        }
        Section(header: Text("Enter Input Unit")) {
          Picker("Enter Input Unit", selection: $inputUnit) {
            ForEach(0..<units.count) { i in
              Text(units[i].symbol)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        Section(header: Text("Enter Output Unit")) {
          Picker("Enter Output Unit", selection: $outputUnit) {
            ForEach(0..<units.count) { i in
              Text(units[i].symbol)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        Section(header: Text("Converted Amount")) {
          Text("\(converted)")
        }
      }
    }
  }
}

struct ContentNewView_Previews: PreviewProvider {
  static var previews: some View {
    ContentNewView()
  }
}
