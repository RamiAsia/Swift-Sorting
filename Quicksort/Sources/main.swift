class QuickSort {

  func quicksort<T: Comparable> (_ arr: [T] ) -> [T] {
    if arr.isEmpty {
        return arr
    } else {
        // Start with the first element in array
        let head = arr[0]
        // The body is whatever follows the head
        let body = arr[1..<arr.count]
        /* Filter the body for any values less than the head, and values greater than head.
        ** Recursively call quicksort method on each array to sort them
        */
        let less = quicksort(body.filter( {$0 < head} ))
        let greater = quicksort(body.filter( {$0 >= head} ))
        // return the sorted less array followed by the head followed by the sorted greater array
        return less + [head] + greater
    }
  }
}


let testArray = QuickSort().quicksort([3, 1, 5, 7, 9, 5, 4, 2])

print(testArray)

print(QuickSort().quicksort(["Why", "Hello", "There", ",", "Clarice"]))
