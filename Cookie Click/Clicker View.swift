import SwiftUI

struct ClickerView: View {
    @State private var sheetShop = false
    
    var body: some View {
        VStack {
            ClickerTopbar()
            
            Spacer()
            
            Button {
                print("123")
            } label: {
                Image(systemName: "carrot")
                    .fontSize(160)
            }
            
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
