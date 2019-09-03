struct Spacer: View {
    var size: CGFloat
    
    var body: View { return self }
}

extension Spacer: ViewRepresentable {
    func makeUIView(context: ViewContext) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: ViewContext) {
        uiView.backgroundColor = .clear
    }
}
