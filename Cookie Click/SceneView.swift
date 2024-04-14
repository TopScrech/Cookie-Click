import SwiftUI
import SceneKit

struct SceneKitView: UIViewControllerRepresentable {
    var scene: SCNScene
    var setupScene: (SCNView) -> Void
    
    init(_ scene: SCNScene, setupScene: @escaping (SCNView) -> Void) {
        self.scene = scene
        self.setupScene = setupScene
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let sceneView = SCNView()
        sceneView.scene = scene
        sceneView.backgroundColor = .secondarySystemBackground
        viewController.view = sceneView
        setupScene(sceneView)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Handle updates
    }
}
