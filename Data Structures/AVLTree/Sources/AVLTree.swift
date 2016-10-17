class AVLTree<T: Comparable> {
    var root: TreeNode<T>?

    public var height: Int? {
        return root?.height
    }


    public func insert(_ item: T) {

        root = insert(item, atNode: self.root)
    }

    public func insert(_ item: T, atNode: TreeNode<T>?) -> TreeNode<T> {
        if let node = atNode {
            if item <= node.item! {
                node.leftNode = insert(item, atNode: node.leftNode)
            }
            else {
                node.rightNode = insert(item, atNode: node.rightNode)
            }
        }
        else {
            return TreeNode<T>(item: item)
        }

        // Check the balance

        let balance = getBalance(of: atNode!)

        // if let
        // Right rotate
        if balance > 1 && item < (atNode!.leftNode?.item)! {
            return rightRotate(atNode!)
        }

        // Left rotate
        if balance < -1 && item > (atNode!.rightNode?.item)! {
            return leftRotate(atNode!)
        }

        // Left Right rotate
        if balance > 1 && item > (atNode!.leftNode?.item)! {
            atNode!.leftNode = leftRotate(atNode!.leftNode!)
            return rightRotate(atNode!)
        }

        // Right Left rotate
        if balance < -1 && item < (atNode!.rightNode?.item)! {
            atNode!.rightNode = rightRotate(atNode!.rightNode!)
            return leftRotate(atNode!)
        }

        return atNode!
    }


    private func leftRotate(_ node: TreeNode<T>) -> TreeNode<T> {
        let newCenter = node.rightNode!
        let newRight = newCenter.leftNode

        newCenter.leftNode = node
        node.rightNode = newRight

        return newCenter
    }


    private func rightRotate(_ node: TreeNode<T>) -> TreeNode<T> {
        let newCenter = node.leftNode!
        let newLeft = newCenter.rightNode

        newCenter.rightNode = node
        node.leftNode = newLeft

        return newCenter
    }

    public func getBalance(of: TreeNode<T>) -> Int {
        var leftHeight = 0
        var rightHeight = 0

        if let leftNode = of.leftNode {
            leftHeight = leftNode.height
        }

        if let rightNode = of.rightNode {
            rightHeight = rightNode.height
        }

        return leftHeight - rightHeight
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
