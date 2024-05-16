import SwiftUI
import SwiftData

@available(iOS 17, *)
@main
struct MyApp: App {
    
    let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: Checklist.self, ChecklistSection.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
//    
    var body: some Scene {
        WindowGroup {
            
            HomeView()
                .modelContainer(modelContainer)
        }
    }
}
