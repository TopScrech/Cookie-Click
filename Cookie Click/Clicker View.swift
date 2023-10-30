import SwiftUI

struct ClickerView: View {
    @State private var sheetShop = false
    
    var body: some View {
        VStack {
            ClickerTopbar()
            
            Spacer()
            
            Image(systemName: "carrot")
                .fontSize(160)
            
            HStack {
                Text("Click")
                    .monospaced()
                
                Image(systemName: "hand.tap")
            }
            .foregroundStyle(.secondary)
            
            Spacer()
            
            ClickerDownbar($sheetShop)
        }
        //        .background {
        //            Image()
        //        }
        .sheet($sheetShop) {
            ShopView()
        }
    }
}

#Preview {
    ClickerView()
}
