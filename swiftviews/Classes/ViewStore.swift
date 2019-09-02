
public struct ViewContext {
    internal var modifiers: [ViewModifier] = []
}

class ViewStore {
    func viewFor(representable: ViewRepresentable, context: ViewContext) -> UIView {
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
        
        if let representable = view as? ViewRepresentable {
            let view = representable.makeUIView(context: context)
            representable.updateUIView(view, context: context)
            return view
        }
        
        let uiView = self.viewFor(view: view.body, context: context)
        
        for modifier in context.modifiers {
            modifier.update(uiView: uiView, context: context)
        }
        
        return uiView
    }
}
