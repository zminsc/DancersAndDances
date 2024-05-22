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
    
    @State private var newDancer: Dancer?
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(dancers) { dancer in
                    NavigationLink {
                        DancerDetail(dancer: dancer)
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
            .sheet(item: $newDancer) { dancer in
                NavigationStack {
                    DancerDetail(dancer: dancer, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a dancer")
                .navigationTitle("Dancer")
        }
    }
    
    private func addDancer() {
        let newItem = Dancer(name: "")
        modelContext.insert(newItem)
        newDancer = newItem
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
        .modelContainer(SampleData.shared.modelContainer)
}
