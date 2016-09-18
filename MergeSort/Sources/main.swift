class MergeSort {

    func mergeSort<T: Comparable> (_ array: [T]) -> [T] {
        var sortedArray = array
        if array.count > 1 {
            // Recursively sort the left half of the array, followed by the right half
            let leftArray = mergeSort(Array(array[0..<(array.count/2)]))
            let rightArray = mergeSort(Array(array[(array.count/2)..<array.count]))

            // Once each side is sorted, call the mergeArrays method to merge them into one sorted array
            sortedArray = mergeArrays(arrayOne: leftArray, arrayTwo: rightArray)
        }
        return sortedArray
    }

    func mergeArrays<T: Comparable>(arrayOne: [T], arrayTwo: [T]) -> [T] {
        // resultArray is where we'll be inserting our values from the two arrays to merge
        var resultArray = [T]()

        var indexOne = 0, indexTwo = 0

        /* Traverse the arrays, keeping track of their indices to make sure both arrays
        ** are completely emptied into the merged array in the correct order
        */
        while indexOne < arrayOne.count {
            /* Insert the second array's values into the merged array until it has a value greater than
            ** the one currently being checked in the first array
            */
            while indexTwo < arrayTwo.count && arrayTwo[indexTwo] <= arrayOne[indexOne] {
                resultArray += [arrayTwo[indexTwo]]
                indexTwo += 1
            }
            /* Once all values less than the first array's current value have been
            ** added to the result array, add the first array's current value.
            */
            resultArray += [arrayOne[indexOne]]
            indexOne += 1
        }
        /* In some cases, the first array will be emptied, and the second array
        ** will have larger values still not added to the merged array. Add them now.
        */
        if indexTwo < (arrayTwo.count) {
            resultArray += Array(arrayTwo[indexTwo..<arrayTwo.count])
        }

        return resultArray
    }

}


let test = [2, 6, 4, 8, 9, 3, 4, 6, 2, 1]

print(MergeSort().mergeSort(test))
