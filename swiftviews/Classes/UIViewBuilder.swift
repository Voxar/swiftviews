
public struct ViewContext {
    internal var modifiers: [ViewModifier] = []
    internal var stack: [View] = []
    
    var parent: View? { return stack.last }
}

class UIViewBuilder {
    func viewFor(representable: UIViewRepresentable, context: ViewContext) -> UIView {
        let view = representable.makeUIView(context: context)
        representable.updateUIView(view, context: context)
        return view
    }
    
    func viewFor(view: View, context: ViewContext) -> UIView {
        if view is Empty {
            fatalError("Could not find a view")
        }
        
        var context = context
        
        if let modifier = view as? ViewModifier {
            context.modifiers.append(modifier)
        }
        
        let uiView: UIView = {
            if let representable = view as? UIViewRepresentable {
                let view = representable.makeUIView(context: context)
                representable.updateUIView(view, context: context)
                return view
            }
            
            if !(view is ViewModifier) {
                context.stack.append(view)
            }
            return self.viewFor(view: view.body, context: context)
        }()
        
        for modifier in context.modifiers {
            modifier.update(uiView: uiView, context: context)
        }
        
        return uiView
    }
}
