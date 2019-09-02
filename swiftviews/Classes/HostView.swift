public class HostView: UIView {
    public var body: View = Empty() {
        didSet { rebuild() }
    }
    
    let viewStore = ViewStore()
    
    func rebuild() {
        let body = self.body
        
        if body is Empty {
            return
        }
        
        for view in subviews {
            view.removeFromSuperview()
        }
        
        let subview: UIView = viewStore.viewFor(view: body, context: ViewContext())
        
        addSubview(subview)
        
        preservesSuperviewLayoutMargins = true
        let guide = self
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: guide.safeTopAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: guide.safeLeadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: guide.safeTrailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: guide.safeBottomAnchor).isActive = true
    }
}

extension UIView {
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return NSLayoutXAxisAnchor()
        }
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return NSLayoutXAxisAnchor()
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return NSLayoutYAxisAnchor()
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return NSLayoutYAxisAnchor()
        }
    }
}
