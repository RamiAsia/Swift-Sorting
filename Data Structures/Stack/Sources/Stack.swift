class Stack<T>{
    var items = [T]()

    public func push(item: T) {
        items.append(item)
    }

    public func pop() -> T? {
        if items.count > 0 {
            return items.removeLast()
        }
        else {
            return nil
        }
    }
}
