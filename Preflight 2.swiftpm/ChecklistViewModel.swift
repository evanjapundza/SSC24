//
//  ChecklistViewModel.swift
//  Preflight
//
//  Created by Evan Japundza on 2/24/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
class ChecklistViewModel: ObservableObject {
    
    @Published var checklist: Checklist = Checklist(title: "")
    @Published var sections: [ChecklistSection] = []
    @Published var checklistTitle: String = ""
    
    func addSection() {
        sections.append(ChecklistSection(title: ""))
        
    }
    
    func addChecklist() {
        checklist = Checklist(title: checklistTitle)
        checklist.mainSections = sections
        sections = []
        checklistTitle = ""
    }
    
    func removeSections() {
        sections = []
    }
    
}
