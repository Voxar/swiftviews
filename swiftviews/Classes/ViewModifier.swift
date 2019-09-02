
import Foundation

public protocol ViewModifier: View {
    func update(uiView: UIView, context: ViewContext)
}

struct GenericViewModifier: ViewModifier {
    let body: View
    let block: (UIView) -> ()
    
    func update(uiView: UIView, context: ViewContext) {
        block(uiView)
    }
}

struct KeyPathViewModifier: ViewModifier {
    let body: View
    let keyPath: String
    let value: Any
    
    func update(uiView: UIView, context: ViewContext) {
        uiView.setValue(value, forKeyPath: keyPath)
    }
}
