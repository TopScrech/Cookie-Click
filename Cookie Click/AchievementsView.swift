import GameKit
import SwiftUI

struct AchievementsView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let gameCenterViewController = GKGameCenterViewController(state: .achievements)
        gameCenterViewController.gameCenterDelegate = context.coordinator
        return gameCenterViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Code to update the UIViewController
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, GKGameCenterControllerDelegate {
        var parent: AchievementsView
        
        init(_ parent: AchievementsView) {
            self.parent = parent
        }
        
        func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true, completion: nil)
        }
    }
}
