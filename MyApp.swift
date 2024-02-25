import SwiftUI

@available(iOS 17.0, *)
@main
struct MyApp: App {
	@State private var stepViewModel = StepViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.environment(stepViewModel)
    }
}
