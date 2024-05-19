//
//  DancerList.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/18/24.
//

import SwiftUI
import SwiftData

struct DancerList: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query(sort: \Dancer.name) private var dancers: [Dancer]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(dancers) { dancer in
                    NavigationLink {
                        Text(dancer.name)
                            .navigationTitle("Dancer")
                    } label: {
                        Text(dancer.name)
                    }

                }
                .onDelete(perform: deleteDancers)
            }
            .navigationTitle("Dancers")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem {
                    Button("Add Dancer", systemImage: "plus") {
                        addDancer()
                    }
                }
            }
        } detail: {
            Text("Select a dancer")
                .navigationTitle("Dancer")
        }
    }
    
    private func addDancer() {
        let newItem = Dancer(name: "")
        modelContext.insert(newItem)
    }
    
    private func deleteDancers(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(dancers[index])
            }
        }
    }
}

#Preview {
    DancerList()
        .modelContainer(for: Dancer.self, inMemory: true)
}
