import UIKit

struct Extension<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

protocol ExtensionSupport {
    associatedtype Compatible
    var extend: Extension<Compatible> { get set }
    static var extend: Extension<Compatible>.Type { get set }
}

extension ExtensionSupport {
    var extend: Extension<Self> {
        get {
            return Extension(self)
        }
        set {

        }
    }
    static var extend: Extension<Self>.Type {
        get {
            return Extension<Self>.self
        }
        set {

        }
    }
}

extension UIView : ExtensionSupport {}

extension Extension where Base == UIView {
    var first: UIView? {
        return self.base.subviews.first
    }
}

let viewExt = UIView()
viewExt.extend.first
