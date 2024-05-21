//
//  DancerDetail.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/19/24.
//

import SwiftUI
import SwiftData

struct DancerDetail: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var dancer: Dancer
    let isNew: Bool
    
    init(dancer: Dancer, isNew: Bool = false) {
        self.dancer = dancer
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $dancer.name)
        }
        .navigationTitle(isNew ? "New Dancer" : "Dancer")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(dancer)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DancerDetail(dancer: Dancer(name: "Lorem"))
            .modelContainer(for: Dancer.self, inMemory: true)
    }
}

#Preview("New Dancer") {
    NavigationStack {
        DancerDetail(dancer: Dancer(name: ""), isNew: true)
            .modelContainer(for: Dancer.self, inMemory: true)
    }
}
