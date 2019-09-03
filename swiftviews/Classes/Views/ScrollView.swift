public struct ScrollView: View {
    public var content: ViewBlock
    public var body: View { return content() }
    public var scrollDirection: ScrollDirection
    
    public enum ScrollDirection {
        case both, horizontal, vertical
    }
    
    public init(scrollDirection: ScrollDirection = .both, _ content: @escaping ViewBlock) {
        self.content = content
        self.scrollDirection = scrollDirection
    }
    
    private let viewBuilder = UIViewBuilder()
}

extension ScrollView: UIViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        return UIScrollView()
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        let view = uiView as! UIScrollView
        
        for view in view.subviews {
            view.removeFromSuperview()
        }
        
        let body = self.body
        
        var context = context
        context.stack.append(self)
        let subview = viewBuilder.viewFor(view: body, context: context)
        
        view.addSubview(subview)
        view.preservesSuperviewLayoutMargins = true
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: subview.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: subview.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: subview.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        
        
        let guide = view
        
        switch scrollDirection {
        case .both:
            subview.heightAnchor.constraint(equalTo: guide.heightAnchor).isActive = true
            subview.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        case .horizontal:
            subview.heightAnchor.constraint(equalTo: guide.heightAnchor).isActive = true
        case .vertical:
            subview.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        }
    }
}
