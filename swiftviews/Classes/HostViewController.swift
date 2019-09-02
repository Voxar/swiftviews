
import UIKit

open class HostViewController: UIViewController, View {
    open var body: View = Label(text: "HostViewController") {
        didSet {
            if isViewLoaded {
                hostView.body = body
            }
        }
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
