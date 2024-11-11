import SwiftUI
import AppKit

@main
struct MacFanControlApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300,
                       minHeight: 400, idealHeight: 400, maxHeight: 400)
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Set the activation policy to regular to show in dock
        NSApp.setActivationPolicy(.regular)
        
        // Create status bar item
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "fan", accessibilityDescription: "Fan Control")
        }
        
        // Bring app to front
        NSApp.activate(ignoringOtherApps: true)
    }
}
