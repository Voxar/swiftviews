public struct Text: View {
    public let text: String
    
    public var body: View { return self }
    
    public init(_ text: String) {
        self.text = text
    }
}

extension Text: UIViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        let view = UILabel()
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        (uiView as! UILabel).text = text
    }
}

