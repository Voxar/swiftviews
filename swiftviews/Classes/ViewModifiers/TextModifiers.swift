public extension View {
    func textAlignment(_ alignment: NSTextAlignment) -> View {
        return GenericViewModifier(body: self) { view in
            (view as? UILabel)?.textAlignment = alignment
        }
    }
    
    func foreground(_ color: UIColor) -> View {
        return GenericViewModifier(body: self) { view in
            (view as? UILabel)?.textColor = color
        }
    }
}


