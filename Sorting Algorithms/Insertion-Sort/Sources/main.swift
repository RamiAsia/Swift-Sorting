class InsertionSort {

    func insertionSort<T: Comparable> (array: [T]) -> [T] {
        // Declare the array that will eventually carry sorted elements
        var resultArray: [T]

        // Iterate through each element, inserting it into the results array
        for element in array {
            resultArray = insert(element: element, array: resultArray)
        }

        return resultArray
    }

    func insert<T: Comparable> (element: T, array: [T]) -> [T] {

        if array.count == 0 {
            return [element]
        }

        // Find the proper index of where to insert the element
        var index = -1
        while index+1 < array.count && (array[index+1] < element) {
            index += 1
        }

        // After finding the appropriate position, return an array with the new element in its rightful position
        var resultArray = [T]()
        if index >= 0 {
            resultArray = array[0...index] + [element]

            if index < (array.count - 1) {
                resultArray += array[index+1..<array.count]
            }

        } else {
            resultArray = [element] + array
        }
        return resultArray
    }
}


print(InsertionSort().insertionSort(array: [5, 3, 7, 8, 12, 5, 1, 9]))
