//
//  DocListItem.swift
//  Document2_SwiftData
//
//  Created by Kelly Sun on 10/13/23.
//

import SwiftUI


struct DocListItem: View {
    let dateFormatter = DateFormatter()
    var doc : Document
    
    init(doc : Document) {
        self.doc = doc
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
    }
    
    var body: some View {
        VStack {
            HStack { Text(doc.name).font(.system(size: 14))
                Spacer() }
            
            HStack { Text("Last Modified: " + dateFormatter.string(from: doc.timestamp)).font(.system(size: 10))
                Spacer() }
            
        }
    }
}


#Preview {
    DocView(doc: Document(name: "Test", content: "Content"))
}

