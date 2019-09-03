public struct Text: View {
    public let text: String
    
    public var body: View { return self }
    
    public init(_ text: String) {
        self.text = text
    }
}

extension Text: UIViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        return UILabel()
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        (uiView as! UILabel).text = text
    }
}

