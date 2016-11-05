class LinkedList<T> {

    var head: Node<T>?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node<T>? {
        return head
    }

    public var count: Int {
        if var node = head {
            var i = 1
            while var currentNode = node.nextNode {
                node = currentNode
                i += 1
            }
            return i
        }
        else {
            return 0
        }
    }

    public var last: Node<T>? {
        if var node = head {
            while let next = node.nextNode {
                node = next
            }
            return node
        }
        else {
            return nil
        }
    }


    public func append(_ item: T) {
        let newNode = Node(item:     item)
        if let lastNode = last {
            lastNode.nextNode = newNode
            newNode.previousNode = lastNode
        }
        else {
            head = Node<T>(item: item)
        }
    }

    public func addItem(_ item: T, atPosition: Int) {
        if isEmpty {
            head = Node<T>(item: item)
        }
        else if atPosition >= count {
            append(item)
        }
        else {
            var indexNode = head!
            for _ in 0..<atPosition {
                indexNode = indexNode.nextNode!
            }
            let newNode = Node<T>(item: item)
            newNode.nextNode = indexNode.nextNode
            indexNode.nextNode = newNode
        }
    }

    public func clearList() {
        head = nil
    }

    public func removeLastItem() -> T? {
        if var node = last {
            let lastCopy = last
            if count > 1 {
                node = node.previousNode!
                node.nextNode = nil
            }
            else {
                removeFirstItem()
            }

            return lastCopy!.item
        }
        return nil
    }

    public func removeFirstItem() {
        if count > 1 {
            head = head!.nextNode
            head!.previousNode = nil
        }
        else if !isEmpty {
            head = nil
        }
    }

    private func remove(_ node: Node<T>) -> T {
        let prev = node.previousNode
        let next = node.nextNode

        if let prev = prev {
            prev.nextNode = next
        }
        else {
            head = next
        }

        next?.previousNode = prev
        node.nextNode = nil
        node.previousNode = nil
        return node.item
    }

    public func removeItem(at: Int) -> T? {
        if count <= at {
            return removeLastItem()
        }
        else {
            var node = head!
            for _ in 0..<at {
                node = node.nextNode!
            }

            return remove(node)
        }
    }
}
