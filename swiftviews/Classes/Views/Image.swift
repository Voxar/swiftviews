import CoreGraphics

public struct Image {
    public var image: UIImage
    
    public init(named name: String) {
        self.image = UIImage(named: name)!
    }
    
    public init(size: CGSize, color: UIColor) {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        
        self.image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
}

extension Image: ViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        return UIImageView()
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        let view = uiView as! UIImageView
        view.image = image
    }
}
