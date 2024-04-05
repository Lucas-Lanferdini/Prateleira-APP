import SwiftUI
import TipKit

@main
struct Prateleira_APPApp: App {
    
    @StateObject private var dataController = DataControllerHist()
    //@StateObject private var dataController2 = DataControllerToDo()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
              //  .environment(\.managedObjectContext, dataController2.container.viewContext)


        }
    }
    init() {
        // Optional configure tips for testing.
        setupTipsForTesting()

        // Configure and load all tips in the app.
        try? Tips.configure()
    }

    // Various way to override tip eligibility for testing.
    // Note: These must be called before `Tips.configure()`.
    private func setupTipsForTesting() {
        do {
            // Show all defined tips in the app.
            // try? Tips.showAllTipsForTesting()

            // Show some tips, but not all.
            // try? Tips.showTipsForTesting([tip1, tip2, tip3])

            // Hide all tips defined in the app.
            // try? Tips.hideAllTipsForTesting()

            // Purge all TipKit-related data.
            try Tips.resetDatastore()
        } catch {
            print(error)
        }
    }
}
