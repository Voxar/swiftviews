
public extension View {
    func background(_ color: UIColor) -> View {
        return GenericViewModifier(body: self) { view in
            view.backgroundColor = color
        }
    }
}
