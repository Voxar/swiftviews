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
        
        
        if context.parent(is: HStack.self) {
            view.widthAnchor.constraint(equalToConstant: size).isActive = true
        }
        if context.parent(is: VStack.self) {
            view.heightAnchor.constraint(equalToConstant: size).isActive = true
        }
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        uiView.backgroundColor = .clear
        
    }
}
