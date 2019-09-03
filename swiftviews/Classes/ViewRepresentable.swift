
public protocol ViewRepresentable: View {
    func makeUIView(context: ViewContext) -> UIView
    
    func updateUIView(_ uiView: UIView, context: ViewContext)
}

extension ViewRepresentable {
    public var body: View { return self }
}
