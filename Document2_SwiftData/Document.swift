//
//  Item.swift
//  Document2_SwiftData
//
//  Created by Kelly Sun on 10/13/23.
//

import SwiftData
import Foundation



@Model
final public class Document {
    //@Attribute(originalName: "name_")
    var name: String
    
    //@Attribute(originalName: "timestamp_")
    var timestamp: Date
    
    //@Attribute(originalName: "content_")
    var content: String
    var size: Int
    var createDate: Date
    
//    @Attribute(.unique, originalName: "uuid_")
//    var uuid: UUID
    
    init(name: String, content: String){
        self.timestamp = Date()
        //self.uuid = UUID()
        self.name = name
        self.content = content
        self.size = content.count
        self.createDate = Date()
    }
    
    func update(name: String, content: String){
        self.timestamp = Date()
        self.name = name
        self.content = content
        self.size = content.count
        self.createDate = createDate
    }
    
    
    
    
}
