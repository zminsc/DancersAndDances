//
//  ContentView.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Text("Hello, world!")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Dancer.self, inMemory: true)
}
