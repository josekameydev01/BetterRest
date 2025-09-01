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
        var dateComponents = DateComponents()
        dateComponents.hour = 8
        dateComponents.minute = 0
        print(Calendar.current.date(from: dateComponents) ?? .now)
    }
}

#Preview {
    ContentView()
}
