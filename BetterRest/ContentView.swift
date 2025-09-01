//
//  ContentView.swift
//  BetterRest
//
//  Created by carlosgalvankamey on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
            .labelsHidden()
    }
}

#Preview {
    ContentView()
}
