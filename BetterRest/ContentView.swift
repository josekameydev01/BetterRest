//
//  ContentView.swift
//  BetterRest
//
//  Created by carlosgalvankamey on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    private let currentDate = Date.now
    
    var body: some View {
        Text(currentDate, format: .dateTime.hour().minute())
        Text(currentDate, format: .dateTime.day().month().year())
        Text(currentDate.formatted(date: .numeric, time: .shortened))
    }
}

#Preview {
    ContentView()
}
