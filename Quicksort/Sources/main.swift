class QuickSort {

  func quicksort<T: Comparable> (_  arr: [T] ) -> [T] {
    if arr.isEmpty {
      return arr
    } else {
      let head = arr[0]
      let body = arr[1..<arr.count]
      let less = quicksort(body.filter( {$0 < head} ))
      let greater = quicksort(body.filter( {$0 >= head} ))
      return less + [head] + greater
    }
  }
}


let testArray = QuickSort().quicksort([3, 1, 5, 7, 9, 5, 4, 2])

print(testArray)

print(QuickSort().quicksort(["Why", "Hello", "There", ",", "Clarice"]))
