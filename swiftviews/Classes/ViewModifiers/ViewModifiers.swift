
public extension View {
    func contentMode(_ mode: UIView.ContentMode) -> ViewModifier {
        return GenericViewModifier(body: self) { view in
            view.contentMode = mode
        }
    }
    
    
    func contentHuggingPriority(horizontal: UILayoutPriority? = nil, vertical: UILayoutPriority? = nil) -> View {
        return GenericViewModifier(body: self) { view in
            horizontal.flatMap({
                view.setContentHuggingPriority(
                    $0, for: .horizontal
                )
            })
            vertical.flatMap({
                view.setContentHuggingPriority(
                    $0, for: .vertical
                )
            })
        }
    }
    
    func contentCompressionResistance(horizontal: UILayoutPriority? = nil, vertical: UILayoutPriority? = nil) -> View {
        return modifier { view in
            horizontal.flatMap({
                view.setContentCompressionResistancePriority(
                    $0, for: .horizontal
                )
            })
            vertical.flatMap({
                view.setContentCompressionResistancePriority(
                    $0, for: .vertical
                )
            })
        }
    }
    
    func border(width: CGFloat = 1, color: UIColor = .black) -> View {
        return modifier { view in
            view.layer.borderWidth = width
            view.layer.borderColor = color.cgColor
        }
    }
    
    func modifier(_ block: @escaping (UIView) -> ()) -> View {
        return GenericViewModifier(body: self, block: block)
    }
}
