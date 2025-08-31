//
//  ContentView.swift
//  BetterRest
//
//  Created by carlosgalvankamey on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount) hours", value: $sleepAmount)
    }
}

#Preview {
    ContentView()
}
