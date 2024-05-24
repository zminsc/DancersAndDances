//
//  DanceList.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/18/24.
//

import SwiftUI
import SwiftData

struct DanceList: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query(sort: \Dance.name) private var dances: [Dance]
    
    @State private var newDance: Dance?
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(dances) { dance in
                    NavigationLink {
                        DanceDetail(dance: dance)
                    } label: {
                        Text(dance.name)
                    }

                }
                .onDelete(perform: deleteDances)
            }
            .navigationTitle("Dances")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem {
                    Button("Add Dance", systemImage: "plus") {
                        addDance()
                    }
                }
            }
            .sheet(item: $newDance) { dance in
                NavigationStack {
                    DanceDetail(dance: dance, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a dance")
                .navigationTitle("Dance")
        }
    }
    
    private func addDance() {
        let newItem = Dance(name: "")
        modelContext.insert(newItem)
        newDance = newItem
    }
    
    private func deleteDances(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(dances[index])
            }
        }
    }
}

#Preview {
    DanceList()
        .modelContainer(SampleData.shared.modelContainer)
}
