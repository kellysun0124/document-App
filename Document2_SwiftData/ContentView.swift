//
//  ContentView.swift
//  Document2_SwiftData
//
//  Created by Kelly Sun on 10/13/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    var body: some View {
        DocListView()
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Document.self, inMemory: true)
}
