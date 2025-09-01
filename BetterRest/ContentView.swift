//
//  ContentView.swift
//  BetterRest
//
//  Created by carlosgalvankamey on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button("Click me!") {
            printDate()
        }
        .buttonStyle(.borderedProminent)
    }
    
    func printDate() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        print("\(hour):\(minute)")
    }
}

#Preview {
    ContentView()
}
