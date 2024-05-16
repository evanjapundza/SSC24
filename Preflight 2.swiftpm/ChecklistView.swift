//
//  ChecklistView.swift
//  Preflight
//
//  Created by Evan Japundza on 2/26/24.
//

import SwiftUI

@available(iOS 17, *)
struct ChecklistView: View {
    
    var section: ChecklistSection
    
    @State private var currentIndex = 0
    @State private var temporaryToggleStates: [Bool]
    
    init(section: ChecklistSection) {
        self.section = section
        self._temporaryToggleStates = State(initialValue: Array(repeating: false, count: section.items.count))
    }
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    currentIndex = max(currentIndex - 1, 0)
                }
            }) {
                Image(systemName: "arrow.left")
                    .padding()
            }
            .disabled(currentIndex <= 0)
            
            
            if section.items.indices.contains(currentIndex) {
                VStack {
                    Text(section.items[currentIndex].desc)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                    
                    Text(section.items[currentIndex].status)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack {
                        Spacer()
                        Toggle(isOn: $temporaryToggleStates[currentIndex]) {
                            Text("Toggle")
                        }
                        .labelsHidden()
                        Spacer()
                    }
                    
                }
                .padding()
                .transition(.slide)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Button(action: {
                withAnimation {
                    currentIndex = min(currentIndex + 1, section.items.count - 1)
                }
            }) {
                Image(systemName: "arrow.right")
                    .padding()
            }
            .disabled(currentIndex >= section.items.count - 1)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


