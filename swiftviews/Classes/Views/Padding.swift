struct Padding: View {
    
    var body: View
    let insets: UIEdgeInsets
    
    init(body: View, insets: UIEdgeInsets) {
        self.body = body
        self.insets = insets
    }
    
    let viewBuilder = UIViewBuilder()
}

extension Padding: UIViewRepresentable {
    
    func makeUIView(context: ViewContext) -> UIView {
        let content = viewBuilder.viewFor(view: body, context: context)
        let view = UIView()
        view.addSubview(content)
        
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right).isActive = true
        content.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        content.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: ViewContext) {
    }
}

extension View {
    public func padding(_ value: CGFloat) -> View {
        return Padding(body: self, insets: UIEdgeInsets(top: value, left: value, bottom: value, right: value))
    }
}
