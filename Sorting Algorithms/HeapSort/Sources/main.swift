import Foundation

class HeapSort {

    func heapSort<T: Comparable> (array: inout [T]) -> [T] {
        // Turn the unsorted array into a heap
        heapify(array: &array)

        var end = array.count - 1

        /* Since the first element is the largest, swap that with the
        ** last element in the array, then sift down the new root to restore the heap.
        ** Repeat this for all elements counting down from the last element.
        */
        while end > 0 {
            swapValues(&array[end], &array[0])
            end -= 1
            siftDown(array: &array, start: 0, end: end)
        }

        return array
    }



    func heapify<T: Comparable> (array: inout [T]) {

        // To begin heapifying the array, we start with the last parent node
        var start = getParentIndex(childIndex: (array.count - 1))

        while start >= 0 {
            siftDown(array: &array, start: start, end: array.count-1)
            start -= 1
        }


    }

    func siftDown<T: Comparable> (array: inout [T], start: Int, end: Int) {
        var root = start

        while getLeftChild(parentIndex: root) <= end {
            let child = getLeftChild(parentIndex: root)
            var swap = root
            // If the left child has a larger value than the root, take its index for swapping
            if array[swap] < array[child] {
                swap = child
            }
            // Check if the right child is the largest, if so, take its index for swapping
            if child+1 <= end && array[swap] < array[child+1] {
                swap = child + 1
            }

            // If swap equals root, the root is the largest element. Our work for now is done and we're ready for the next swap
            // Otherwise switch the values of "swap" and "root" and continue the loop
            if swap == root {
                return
            } else {
                swapValues(&array[swap], &array[root])
                root = swap
            }
        }
    }

    // Returns the parent node index
    func getParentIndex(childIndex: Int) -> Int {
        if childIndex == 0 {
            return 0
        }


        return Int(floor(Double((childIndex-1)/2)))
    }


    // Returns the index of a heap node's left child
    func getLeftChild(parentIndex: Int) -> Int {
        return (2 * parentIndex) + 1
    }

    func swapValues<T>(_ one: inout T, _ two: inout T) {
        let temp = one
        one = two
        two = temp
    }
}


var testArray = [6, 4, 7, 1, 10, 56, 3, 9, 5]
print(HeapSort().heapSort(array: &testArray))
