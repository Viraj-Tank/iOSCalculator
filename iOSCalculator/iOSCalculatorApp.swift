
import SwiftUI

@main
struct iOSCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
//            if(UIDevice.isIPad) {
//                Text("Testing for iPad")
//            } else {
                CalculatorView()
//            }
        }
    }
}
