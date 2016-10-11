class LinkedList<T> {

    var head: Node<T>?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node<T>? {
        return head
    }

    public var count: Int {
        if let node = head {
            var i = 1
            while var currentNode = node.nextNode {
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
        let newNode = Node(item: item)
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


}
