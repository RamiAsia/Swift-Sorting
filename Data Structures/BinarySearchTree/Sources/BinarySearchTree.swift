class BinarySearchTree<T: Comparable> {
    var root: TreeNode<T>?

    public var height: Int? {
        return root?.height
    }

    public func insert(_ item: T) {
        if root != nil {
            root!.addNode(item)
        }
        else {
            root = TreeNode<T>(item: item)
        }
    }

    public func printInOrder() {
        printInOrder(self.root)
    }

    public func printInOrder(_ node: TreeNode<T>?) {
        if let left = node?.leftNode {
            printInOrder(left)
        }

        if node != nil {
            print((node!.item)!)
        }

        if let right = node?.rightNode {
            printInOrder(right)
        }
    }
}
