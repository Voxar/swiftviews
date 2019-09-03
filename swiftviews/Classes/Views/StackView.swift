
public struct HStack: View {
    public init(
        spacing: CGFloat = 0,
        distribution: UIStackView.Distribution = .fillProportionally,
        content: @escaping ContentBlock
    ) {
        self.body = StackView(
            axis: .horizontal,
            spacing: spacing,
            distribution: distribution,
            content: content
        )
    }
    
    public var body: View
}

public struct VStack: View {
    public init(
        spacing: CGFloat = 0,
        distribution: UIStackView.Distribution = .fillProportionally,
        content: @escaping ContentBlock
        ) {
        self.body = StackView(
            axis: .vertical,
            spacing: spacing,
            distribution: distribution,
            content: content
        )
    }
    
    public var body: View
}

struct StackView: View {
    public let content: ()->([View])
    public var body: View { return self }
    public var axis: UILayoutConstraintAxis
    public var spacing: CGFloat
    public var distribution: UIStackView.Distribution
    
    public init(
        axis: UILayoutConstraintAxis,
        spacing: CGFloat,
        distribution: UIStackView.Distribution,
        content: @escaping ContentBlock
    ) {
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.content = content
    }
    
    private let viewBuilder = UIViewBuilder()
}

extension StackView: UIViewRepresentable {
    public func makeUIView(context: ViewContext) -> UIView {
        let view = UIStackView()
        view.preservesSuperviewLayoutMargins = true
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: ViewContext) {
        let view = uiView as! UIStackView
        view.axis = axis
        view.spacing = spacing
        view.distribution = distribution
        
        for subview in view.arrangedSubviews {
            view.removeArrangedSubview(subview)
        }
        let views = content()
        for subview in views.map({ viewBuilder.viewFor(view: $0, context: context) }) {
            view.addArrangedSubview(subview)
        }
    }
}
