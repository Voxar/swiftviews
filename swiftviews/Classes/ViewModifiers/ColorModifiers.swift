
public extension View {
    func background(color: UIColor) -> View {
        return GenericViewModifier(body: self) { view in
            view.backgroundColor = color
        }
    }
}
