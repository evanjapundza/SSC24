//
//  Checklist.swift
//  Preflight
//
//  Created by Evan Japundza on 2/24/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model class ChecklistSection: Identifiable {
    
    let id = UUID()
    var title: String
    
    var parentChecklist: Checklist?
    
    @Relationship(deleteRule: .cascade, inverse: \ChecklistItem.whichSection)
    var items: [ChecklistItem] = []
    
    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}
