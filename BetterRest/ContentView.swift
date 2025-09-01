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
        DatePicker("Please enter a past date", selection: $wakeUp, in: ...Date.now ,displayedComponents: .date)
            .labelsHidden()
        
        /*
        DatePicker("Please enter a past date", selection: $wakeUp, in: ...Date.now ,displayedComponents: .date)
            .labelsHidden()
         */
    }
}

#Preview {
    ContentView()
}
