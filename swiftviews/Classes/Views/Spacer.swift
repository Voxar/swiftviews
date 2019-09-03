public struct Spacer: View {
    public var size: CGFloat
    
    public var body: View { return self }
    
    public init(size: CGFloat) {
        self.size = size
    }
}

extension Spacer: UIViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        let view = UIView()
        
        
        if let stack = context.parent as? StackView {
            if stack.axis == .horizontal {
                view.widthAnchor.constraint(equalToConstant: size).isActive = true
            } else {
                view.heightAnchor.constraint(equalToConstant: size).isActive = true
            }
        }
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        uiView.backgroundColor = .clear
        
    }
}
