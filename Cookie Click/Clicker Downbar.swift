import SwiftUI

struct ClickerDownbar: View {
    @Binding private var sheet: Bool
    
    init(_ sheet: Binding<Bool>) {
        _sheet = sheet
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    sheet = true
                } label: {
                    HStack {
                        Text("Upgrades")
                            .semibold()
                            .rounded()
                        
                        Spacer()
                        
                        Image(systemName: "arrowshape.up.fill")
                            .foregroundStyle(.blue)
                    }
                    .padding(.horizontal, 20)
                }
                .title2()
                .foregroundStyle(.foreground)
            }
            .frame(minWidth: 200, maxWidth: 400)
            .frame(height: 64)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            
            HStack {
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ClickerDownbar(.constant(false))
}
