import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6 // Set background color of TabBar
    }
    
    var body: some View {
        TabView {
            // First Tab: Home
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "bag.fill")
                }

            // Second Tab: History
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }

            // Third Tab: About Us
            AboutUsView()
                .tabItem {
                    Label("About Us", systemImage: "leaf.fill")
                }

            // Fourth Tab: Contact Us
            ContactUsView()
                .tabItem {
                    Label("Contacts", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
        }
        .accentColor(.red) // Set selected tab item color to red
    }
}

#Preview {
    ContentView()
}
