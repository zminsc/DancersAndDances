//
//  SampleData.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/21/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    var modelContext: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Dancer.self,
            Dance.self,
            DanceDancer.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for dancer in Dancer.sampleData {
            modelContext.insert(dancer)
        }
        
        for dance in Dance.sampleData {
            modelContext.insert(dance)
        }
        
        for danceDancer in DanceDancer.sampleData {
            modelContext.insert(danceDancer)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Could not save sample data.")
        }
    }
    
}
