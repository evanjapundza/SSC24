//
//  NewChecklistView.swift
//  Preflight
//
//  Created by Evan Japundza on 2/24/24.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
struct NewChecklistView: View {
    
    @Environment(\.modelContext) private var context
    @ObservedObject var viewMod: ChecklistViewModel
    @State var checklistTitle = ""
    
    @State var details: [String] = []
    
    @Query var checklistSections: [ChecklistSection]
    
    var body: some View {
        ScrollView {
            VStack {
                
                TextField("Checklist Title", text: $viewMod.checklistTitle)
                    .font(.title)
                
                ForEach($viewMod.sections) { $section in
                    
                    ChecklistSectionView(section: $section)
                    
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
                VStack {
                    
                    HStack(spacing: 5) {
                        Button(action: {
                            
                            if let previousSection = viewMod.sections.last {
                                context.delete(previousSection)
                                viewMod.sections.removeLast()
                            }
                            
                            
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 55)
                        })
                        .disabled(viewMod.sections.isEmpty)
                        
                        Button(action: {
                            let newSection = ChecklistSection(title: "")
                            context.insert(newSection)
                            viewMod.sections.append(newSection)
                        }, label: {
                            VStack {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 55)
                                
                            }
                            
                        })
                    }
                    
                    
                    Text("Add/Delete Section")
                        .tint(.accentColor)
                }
                
            }
            .padding()
        }
    }
}

@available(iOS 17, *)
struct ChecklistSectionView: View {
    @Binding var section: ChecklistSection
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                TextField("Section Title", text: $section.title)
                Spacer()
            }
            
            Rectangle()
                .frame(maxHeight: 1)
            
            ForEach($section.items) { $item in
                ChecklistItemView(item: $item)
            }
            
            VStack {
                HStack(spacing: 5) {
                    Button(action: {
                        section.items.removeLast()
                    }, label: {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 30)
                    })
                    .disabled(section.items.isEmpty)
                    
                    Button(action: {
                        section.items.append(ChecklistItem(description: "", status: ""))
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 30)
                    }
                }
                
                Text("Add/Delete Item and Status")
                    .frame(height: 15)
                    .tint(.accentColor)
            }
        }
        .padding()
    }

    
}

@available(iOS 17, *)
struct ChecklistItemView: View {
    @Binding var item: ChecklistItem
    
    
    var body: some View {
        HStack {
            
            TextField("Item Name", text: $item.desc)
            
            
            TextField("Status", text: $item.status)
        }
    }
}
