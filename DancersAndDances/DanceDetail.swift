//
//  DanceDetail.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/21/24.
//

import SwiftUI
import SwiftData

struct DanceDetail: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var dance: Dance
    let isNew: Bool
    
    init(dance: Dance, isNew: Bool = false) {
        self.dance = dance
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $dance.name)
            
            Section {
                List {
                    ForEach(dance.dancers) { dancer in
                        Text(dancer.name)
                    }
                }
            } header: {
                HStack {
                    Text("Dancers")
                    Spacer()
                    NavigationLink {
                        DancerSelection(dance: dance)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationTitle("Dance")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(dance)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct DancerSelection: View {
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Dancer.name) private var dancers: [Dancer]
    
    let dance: Dance
    
    var body: some View {
        List {
            ForEach(dancers) { dancer in
                Button {
                    dancer.dances.append(dance)
                    dismiss()
                } label: {
                    Text(dancer.name)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DanceDetail(dance: Dance(name: ""), isNew: false)
            .modelContainer(for: Dancer.self, inMemory: true)
    }
}

#Preview("New Dance") {
    NavigationStack {
        DanceDetail(dance: Dance(name: ""), isNew: true)
            .modelContainer(for: Dancer.self, inMemory: true)
    }
}
