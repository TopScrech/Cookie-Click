import SwiftUI

struct ShopView: View {
    @AppStorage("shop_tab") private var shopTab = "Cookie"
    
    private let tabs = ["Cookie", "Auto"]
    
    var body: some View {
        TabView(selection: $shopTab) {
            Text("Cookie")
                .tag("Cookie")
                .tabItem {
                    Label("Cookie", systemImage: "carrot")
                }
            
            Text("Auto")
                .tag("Auto")
                .tabItem {
                    Label("Auto", systemImage: "engine.combustion")
                }
        }
    }
}

#Preview {
    NavigationView {
        ShopView()
    }
}
