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
        TabView {
            DanceList()
                .tabItem {
                    Label("Dances", systemImage: "person.and.person.fill")
                }
            
            DancerList()
                .tabItem {
                    Label("Dancers", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
