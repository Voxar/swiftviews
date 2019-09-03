
import UIKit

open class HostViewController: UIViewController, View {
    open var body: View = Text("HostViewController") {
        didSet {
            if isViewLoaded {
                hostView.body = body
            }
        }
    }
    
    public func rebuild() {
        hostView.rebuild()
    }
    
    let hostView = HostView()
        
    open override func loadView() {
        self.view = hostView
        hostView.backgroundColor = .white
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        hostView.body = self.body
    }
}
