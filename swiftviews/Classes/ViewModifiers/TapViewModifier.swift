import UIKit

public extension View {
    func whenTapped(_ action: @escaping Action) -> View {
        return TapViewModifier<Self>(body, action: { _ in action() })
    }
    
    func whenTapped(_ action: @escaping (UIGestureRecognizer) -> ()) -> View {
        return TapViewModifier<Self>(body, action: action)
    }
}

struct TapViewModifier<V: View>: ViewModifier {
    var body: View
    let gesture: TapGesture
    
    init(_ content: View, action: @escaping TapGesture.Action) {
        self.gesture = TapGesture(action: action)
        self.body = content
    }
    
    func update(uiView: UIView, context: ViewContext) {
        if uiView.gestureRecognizers?.contains(gesture) ?? false {
            return
        }
        uiView.isUserInteractionEnabled = true
        uiView.addGestureRecognizer(gesture)
    }
}

extension TapViewModifier {
    class TapGesture: UITapGestureRecognizer {
        typealias Action = (UIGestureRecognizer) -> ()
        let action: Action
        
        init(action: @escaping Action) {
            self.action = action
            super.init(target: nil, action: nil)
            self.addTarget(self, action: #selector(runAction(_:)))
        }
        
        @objc func runAction(_ gesture: UIGestureRecognizer) {
            action(gesture)
        }
    }
}

