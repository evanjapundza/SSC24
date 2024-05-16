import SwiftUI
import SwiftData

@available(iOS 17, *)
struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    @ObservedObject var viewModel = ChecklistViewModel()
    @State var showingNewChecklistView = false
    @Query var checklists: [Checklist]
    
    var body: some View {
        NavigationStack {
            VStack {

                List {
                    ForEach(checklists) { checklist in
                        NavigationLink {
                            DetailsView(currentChecklist: checklist)
                        } label: {
                            Text(checklist.title)
                        }
                    }
                    .onDelete(perform: removeChecklist)
                    

                }
                
                
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showingNewChecklistView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .navigationTitle("Checklists")
            .sheet(isPresented: $showingNewChecklistView) {
                if !viewModel.checklistTitle.isEmpty {
                    viewModel.addChecklist()
                    context.insert(viewModel.checklist)
                } else {
                    viewModel.removeSections()
                }
            } content: {
                NewChecklistView(viewMod: viewModel)
            }
        }
        
    }
    
    private func removeChecklist(at indexSet: IndexSet) {
        for index in indexSet {
            context.delete(checklists[index])
        }
    }
}
