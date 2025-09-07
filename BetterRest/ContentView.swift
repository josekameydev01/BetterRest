//
//  ContentView.swift
//  BetterRest
//
//  Created by carlosgalvankamey on 8/30/25.
//

import CoreML
import SwiftUI

struct ContentView: View {
    static var defaultWakeUp: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    private var bedTime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeCups))
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Error calculating bedtime"
        }
    }
    
    @State private var wakeUp = defaultWakeUp
    @State private var sleepAmount = 8.0
    @State private var coffeeCups = 0
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section(header: Text("Desired amout of sleep")) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section(header: Text("Daily coffee intake")) {
                    Picker("Coffee cups", selection: $coffeeCups) {
                        ForEach(0..<21) {
                            Text("\($0) \(cupLabel(for: $0))")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section(header: Text("Recommended Bedtime")) {
                    Text("\(bedTime)")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    private func cupLabel(for quantity: Int) -> String {
        quantity == 1 ? "cup" : "cups"
    }
}

#Preview {
    ContentView()
}
