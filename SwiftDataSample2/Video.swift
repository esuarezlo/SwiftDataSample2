//
//  Video.swift
//  SwiftDataSample2
//
//  Created by ernsmac on 14/08/24.
//

import Foundation
import SwiftData

@Model
class Video{
    @Attribute(.unique)
    var id: UUID
    var title:String
    
    @Transient
    var numberOfLikes: Int{title.count}
    
    @Relationship(deleteRule:.cascade)
    var metadata: Metadata
    
    init(id: UUID, title: String, metadata: Metadata) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}
