//
//  DetailsView.swift
//  Preflight
//
//  Created by Evan Japundza on 2/24/24.
//

import SwiftUI

@available(iOS 17, *)
struct DetailsView: View {
    @Environment(\.editMode) var editMode
    var currentChecklist: Checklist
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                    Text(currentChecklist.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    
                }
                
                ForEach(currentChecklist.mainSections) { section in
                    VStack {
                        HStack {
                            Spacer()
                            
                            Text(section.title)
                                .font(.title3)
                                .bold()
                            
                            Spacer()
                            
                            NavigationLink {
                                ChecklistView(section: section)
                            } label: {
                                Image(systemName: "play.fill")
                            }

                            
                        }
                        
                        Rectangle()
                            .frame(maxHeight: 1)
                        
                        
                        ForEach(section.items) { item in
                            HStack {
                                Text(item.desc)
                                
                                Spacer()
                                
                                Text(item.status)
                            }
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    
                }
                
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
