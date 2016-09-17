class MergeSort {

    func mergeSort<T: Comparable> (_ array: [T]) -> [T] {
        var sortedArray = array
        if array.count > 1 {
            let leftArray = mergeSort(Array(array[0..<(array.count/2)]))
            let rightArray = mergeSort(Array(array[(array.count/2)..<array.count]))
            sortedArray = mergeArrays(arrayOne: leftArray, arrayTwo: rightArray)
        }
        return sortedArray
    }

    func mergeArrays<T: Comparable>(arrayOne: [T], arrayTwo: [T]) -> [T] {
        var resultArray = [T]()

        var indexOne = 0, indexTwo = 0

        while indexOne < arrayOne.count {

            while indexTwo < arrayTwo.count && arrayTwo[indexTwo] <= arrayOne[indexOne] {
                resultArray += [arrayTwo[indexTwo]]
                indexTwo += 1
            }
            resultArray += [arrayOne[indexOne]]
            indexOne += 1
        }
        if indexTwo < (arrayTwo.count) {
            resultArray += Array(arrayTwo[indexTwo..<arrayTwo.count])
        }

        print("Result size: \(resultArray.count)")
        return resultArray
    }

}


let test = [2, 6, 4, 8, 9, 3, 4, 6, 2, 1]

print(MergeSort().mergeSort(test))
