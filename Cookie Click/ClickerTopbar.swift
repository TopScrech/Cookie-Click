import SwiftUI

struct ClickerTopbar: View {
    @State private var rotation = 0.0
    
    @State private var showAchievements = false
    
    var body: some View {
        HStack {
            Button {
                showAchievements = true
            } label: {
                Image(systemName: "star.fill")
                    .largeTitle()
                    .foregroundStyle(.yellow)
                    .frame(width: 64, height: 64)
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            }
            
            VStack {
                Text("100.000")
                    .title2()
                    .bold()
                    .foregroundStyle(.orange)
                
                HStack(spacing: 0) {
                    Text("0.00")
                        .foregroundStyle(.secondary)
                    
                    Text("/sec")
                        .foregroundStyle(.tertiary)
                }
                .semibold()
            }
            .frame(height: 64)
            .frame(minWidth: 100, maxWidth: 250)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            
            Button {
                
            } label: {
                Image(systemName: "gear")
                    .largeTitle(.semibold)
                    .foregroundStyle(.gray)
                    .frame(width: 64, height: 64)
                    .rotationEffect(Angle.degrees(rotation))
                    .animation(
                        .linear(duration: 60).repeatForever(autoreverses: false),
                        value: rotation
                    )
                    .onAppear() {
                        rotation = 360
                    }
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            }
        }
        .padding(.horizontal)
        .sheet($showAchievements) {
            AchievementsView()
        }
    }
}

#Preview {
    ClickerTopbar()
}
