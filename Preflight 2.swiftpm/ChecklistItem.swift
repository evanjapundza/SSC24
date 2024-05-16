//
//  ChecklistItem.swift
//  Preflight
//
//  Created by Evan Japundza on 2/25/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model class ChecklistItem: Identifiable {
    @Attribute(.unique) let id = UUID()
    var desc: String
    var status: String    

    var whichSection: ChecklistSection?
    
    init(id: UUID = UUID(), description: String, status: String) {
        self.id = id
        self.desc = description
        self.status = status
    }
}
