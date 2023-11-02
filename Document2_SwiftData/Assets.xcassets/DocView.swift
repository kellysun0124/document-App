//
//  DocView.swift
//  Document2_SwiftData
//
//  Created by Kelly Sun on 10/13/23.
//

import SwiftUI
import SwiftData

struct DocView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State var timestamp : Date?
    @State var name: String = ""
    @State var content: String = ""
    @State var createDate: Date?

    let dateFormatter = DateFormatter()
    var doc: Document?
    
    init () {
        
    }
    
    init(doc: Document) {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.doc = doc
    }
    @State var titleEmpty = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    Text("Title:").font(.system(size: 12))
                    TextField("new title", text: $name)
                    Spacer()
                }
                
                if let createDate {
                    HStack{
                        Text("Created on:").font(.system(size: 12))
                        Text(dateFormatter.string(from: createDate)).font(.system(size: 12))
                        Spacer()
                    }
                }
                
                VStack {
                    HStack {
                        Text("Content:").font(.system(size: 12))
                        Spacer()
                    }
                    TextEditor(text: $content)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 0.5))
                        .foregroundStyle(.primary)
                }
                
                if let timestamp {
                    HStack (spacing: 2){
                        Text("last modified: ").font(.system(size: 10))
                        Text(dateFormatter.string(from: timestamp)).font(.system(size: 10))
                    }
                    
                }
            }
            .padding(15)
            .onAppear {
                guard let doc else { return }
                name = doc.name
                content = doc.content
                timestamp = doc.timestamp
                createDate = doc.createDate
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: saveButton)
            .alert(isPresented: $titleEmpty) {
                Alert(title: Text("Missing Title"), message: Text("A title must be provided"), dismissButton: .default(Text("ok")))}
        }
    }
    
    var saveButton: some View {
        Button(action: {
            if let doc {
                if (name != ""){
                    doc.update(name: name, content: content)
                    dismiss()
                } else {
                    titleEmpty = true
                }
            } else {
                if (name != ""){
                    modelContext.insert(Document(name: name, content: content))
                    dismiss()
                } else {
                    titleEmpty = true
                    //print("yes pls")
                }
            }
            //dismiss()
        })
        { Text("Save") }
        
       
    }
    
//    var saveButtonUpdate: some View {
//        Button(action: {
//            if let doc {
//                if (name != doc.name) {
//                    modelContext.insert(Document(name: name, content: content))
//                } else {
//                    doc.update(name: name, content: content)
//                }
//            } else {
//                modelContext.insert(Document(name: name, content: content))
//            }
//            dismiss ()
//        })
//        { Text ("Save") }
//    }
    
    var backButton :some View {
        Button(action: {
            dismiss()
        })
        { Text("Cancel") }
    }

}
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    DocView(doc: Document(name: "Test", content: "Content"))
}
