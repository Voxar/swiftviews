public typealias Action = () -> ()
public typealias ViewBlock = () -> View
public typealias ContentBlock = () -> [View]

public protocol View {
    var body: View { get }
}

public struct Empty: View {
    public var body: View { return self }
}



