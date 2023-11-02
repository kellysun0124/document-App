//
//  DocListView.swift
//  Document2_SwiftData
//
//  Created by Kelly Sun on 10/13/23.
//

import SwiftUI
import SwiftData

struct DocListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Document.timestamp, order: .forward) private var docs: [Document]
    
//    @State var showingNewDocPopover = false
//    @State var showingDeleteDocErrorAlert = false
//    @State var deleteDocErrorMessage = ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(docs){
                    doc in NavigationLink { DocView(doc: doc)
                    } label: {
                        DocListItem(doc: doc)
                    }
                }
                .onDelete(perform: deleteDoc)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem{
                    NavigationLink {
                        DocView()
                    } label: {
                        Label("add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Documents")
        }
    }
    
//    private func addDoc(name: String, timestamp: Date, content: String) {
//        withAnimation {
//            let newDoc = Document(name: name, content: content)
//            context.insert(newDoc)
//        }
//    }
    
    private func deleteDoc(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(docs[index])
            }
        }
            
    }
}



#Preview {
    DocListView()
        .modelContainer(for: Document.self, inMemory: true)
}

