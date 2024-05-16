//
//  ChecklistModel.swift
//  Preflight
//
//  Created by Evan Japundza on 2/24/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model class Checklist: Identifiable {
    var id: UUID
    var title: String
    
    @Relationship(deleteRule: .cascade, inverse: \ChecklistSection.parentChecklist)
    var mainSections: [ChecklistSection] = []
    
    
    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
    
}
