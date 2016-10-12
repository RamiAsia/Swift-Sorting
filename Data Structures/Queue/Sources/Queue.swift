class Queue<T> {
    var items = [T]()

    public func insert(item: T) {
        items.append(item)
    }


    public func poll() -> T? {
        if items.count > 0 {
            return items.removeFirst()
        }
        else {
            return nil
        }
    }
}
