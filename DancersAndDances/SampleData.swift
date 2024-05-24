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
        
        Dancer.sampleData[1].dances.append(Dance.sampleData[0])
        Dancer.sampleData[3].dances.append(Dance.sampleData[0])
        Dancer.sampleData[0].dances.append(Dance.sampleData[1])
        Dancer.sampleData[1].dances.append(Dance.sampleData[1])
        Dancer.sampleData[2].dances.append(Dance.sampleData[2])
        Dancer.sampleData[2].dances.append(Dance.sampleData[3])
        
        do {
            try modelContext.save()
        } catch {
            print("Could not save sample data.")
        }
    }
    
}
