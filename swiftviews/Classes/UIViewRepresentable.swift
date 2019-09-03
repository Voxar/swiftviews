
public protocol UIViewRepresentable: View {
    func makeUIView(context: ViewContext) -> UIView
    
    func updateUIView(_ uiView: UIView, context: ViewContext)
}

extension UIViewRepresentable {
    public var body: View { return self }
}
