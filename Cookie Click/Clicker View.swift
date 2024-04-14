import ScrechKit
import SceneKit

struct ClickerView: View {
    private var scene = SCNScene()
    
    @State private var sheetShop = false
    @State private var activeNodes = 0
    
    var body: some View {
        VStack {
            ClickerTopbar()
            
            Text("Active Nodes: \(activeNodes)")
            
            Spacer()
            
            Button {
                launchRandomImageNode()
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
        .background {
            SceneKitView(scene) { sceneView in
                setupScene(sceneView)
            }
            .ignoresSafeArea()
        }
        .sheet($sheetShop) {
            ShopView()
        }
    }
    
    func launchRandomImageNode() {
        let image = UIImage(named: "modern")
        
        let imageMaterial = SCNMaterial()
        imageMaterial.diffuse.contents = image
        
        let imagePlane = SCNPlane(width: 1, height: 1)
        imagePlane.materials = [imageMaterial]
        
        let imageNode = SCNNode(geometry: imagePlane)
        imageNode.position = .init(x: 0, y: 0, z: 0)
        imageNode.scale = .init(x: 0.5, y: 0.5, z: 0.5)
        scene.rootNode.addChildNode(imageNode)
        scene.physicsWorld.gravity = .init(x: 0, y: 0, z: 0)
        scene.physicsWorld.speed = 0.5
        
        // Apply random force
        let randomX = Float.random(in: -5...5)
        let randomY = Float.random(in: -5...5)
        let force = SCNVector3(randomX, randomY, 0)
        imageNode.physicsBody = .init(type: .dynamic, shape: nil)
        imageNode.physicsBody?.applyForce(force, asImpulse: true)
        
        activeNodes += 1
        
        delay(5) {
            imageNode.removeFromParentNode()
            //            imageNode.worldPosition.x
            self.activeNodes -= 1
        }
        
        // Schedule a check to remove the node if it goes off-screen
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneView = windowScene.windows.first?.rootViewController?.view as? SCNView,
               let pointOfView = sceneView.pointOfView {
                
                let projectedPoint = sceneView.projectPoint(imageNode.position)
                let isInFrontOfCamera = SCNVector3ProjectPointIsInFrontOfNode(pointOfView, point: imageNode.position)
                
                print("Timer fired, isInFrontOfCamera: \(isInFrontOfCamera), projectedPoint: \(projectedPoint)")
                
                if !isInFrontOfCamera || projectedPoint.x < 0 || projectedPoint.y < 0 || projectedPoint.x > Float(sceneView.bounds.size.width) || projectedPoint.y > Float(sceneView.bounds.size.height) {
                    print("Node should be removed")
                    imageNode.removeFromParentNode()
                    activeNodes -= 1
                    timer.invalidate()
                }
                //            } else {
                //                print("SCNView or pointOfView not found.")
            }
        }
    }
    
    func setupScene(_ sceneView: SCNView) {
        let cameraNode = SCNNode()
        cameraNode.camera = .init()
        cameraNode.position = .init(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
    }
    
    func SCNVector3ProjectPointIsInFrontOfNode(_ pointOfView: SCNNode, point: SCNVector3) -> Bool {
        let localPoint = pointOfView.convertPosition(point, from: nil)
        return localPoint.z < 0
    }
}

#Preview {
    ClickerView()
}
