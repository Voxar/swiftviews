
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
    
    func modifier(_ block: @escaping (UIView) -> ()) -> View {
        return GenericViewModifier(body: self, block: block)
    }
}
