public struct Label: View {
    public let text: String
    
    public var body: View { return self }
    
    public init(text: String) {
        self.text = text
    }
}

extension Label: ViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        return UILabel()
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        (uiView as! UILabel).text = text
    }
}
