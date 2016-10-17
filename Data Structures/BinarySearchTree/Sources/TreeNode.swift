public class TreeNode<T: Comparable> {
    var item: T?
    var leftNode: TreeNode<T>?
    var rightNode: TreeNode<T>?

    init(item: T) {
        self.item = item
    }

    init(){

    }

    public var height: Int {
        var leftHeight = 0
        var rightHeight = 0
        if let left = leftNode {
            leftHeight = left.height
        }

        if let right = rightNode {
            rightHeight = right.height
        }

        return 1 + max(leftHeight, rightHeight)
    }

    // Add a new node based on its value
    public func addNode(_ newItem: T) {

        if newItem <= self.item! {
            // In this case the new item's value is less than or equal to the current node's
            if let left = self.leftNode {
                left.addNode(newItem)
            }
            else {
                let newLeft = TreeNode<T>()
                newLeft.item = newItem
                self.leftNode = newLeft
            }
        }
        else {
            // In this case the item's value is greater than the current node's
            if let right = self.rightNode {
                right.addNode(newItem)
            }
            else {
                let newRight = TreeNode<T>()
                newRight.item = newItem
                self.rightNode = newRight
            }
        }
    }
}
