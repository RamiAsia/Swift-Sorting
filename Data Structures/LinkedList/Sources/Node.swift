public class Node<T> {
    var item: T
    var nextNode: Node<T>?
    weak var previousNode: Node<T>?

    public init(item: T) {
        self.item = item;
    }
}
