class RadixSort {

    func radixSort (array: [Int]) -> [Int] {
        /* We find how many digits we'll have to cover in our sorting, then
        ** pass the array, an initial exponent of 10 to determine the digit to sort,
        ** and the maximum amount of digits we'll have to cover into the bucketize method
        */
        if(array.count == 0) {
            return array
        }
        let maxDigits = countDigits(number: array.max()!)
        return bucketize(array: array, exp: power(base: 10, power: maxDigits))
    }


    // MARK: Utility Methods

    func bucketize (array: [Int], exp: Int) -> [Int] {
        // In the case we are done traversing the digits, exit method
        if(countDigits(number: exp) <= 0) {
            return array
        }

        // Initialize the array we want to store our results in, as well as the buckets
        var resultArray = [Int]()
        var buckets = Dictionary<Int, [Int]>()

        // Take all numbers in the array and put them in their respective buckets
        for number in array {
            if buckets[(number/exp)%10] != nil {
                buckets[(number/exp)%10]! += [number]
            } else {
                buckets[(number/exp)%10] = [number]
            }
        }

        /* Once done filling buckets, traverse the buckets in ascending order
        ** and recursively sort them, then add the buckets to the result array
        */
        for index in 0..<10 {
            if buckets[index] != nil {
                resultArray += bucketize(array: buckets[index]!, exp: exp/10)
            }
        }

        return resultArray
    }


    // Simple method to count digits of a number
    func countDigits(number: Int) -> Int {
        var digitCount = 0
        var numberCopy = number
        while numberCopy > 0 {
            numberCopy = numberCopy/10
            digitCount += 1
        }

        return digitCount
    }

    // Simple method to return base to the power of 'power'
    func power(base: Int, power: Int) -> Int {
        var number = base
        for _ in 0..<power {
            number = number * base
        }

        return number
    }
}


// Simple test of the algorithm
print(RadixSort().radixSort(array: [5, 67, 3, 1, 89, 100, 34, 78, 23, 103]))
