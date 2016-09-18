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

    func bucketize (array: [Int], exp: Int) -> [Int] {
        if(countDigits(number: exp) <= 0) {
            return array
        }
        var resultArray = [Int]()
        var buckets = Dictionary<Int, [Int]>()
        for number in array {
            //buckets[(number/exp)%10] = buckets[(number/exp)%10] ? (buckets[(number/exp)%10]! + [number]) : [number]
            if buckets[(number/exp)%10] != nil {
                buckets[(number/exp)%10]! += [number]
            } else {
                buckets[(number/exp)%10] = [number]
            }
        }

        for index in 0..<10 {
            //resultArray += buckets[index] ? bucketize(array: buckets[index]!, exp: exp*10, max: max) : []
            if buckets[index] != nil {
                resultArray += bucketize(array: buckets[index]!, exp: exp/10)
            }
        }

        return resultArray
    }

    func countDigits(number: Int) -> Int {
        var digitCount = 0
        var numberCopy = number
        while numberCopy > 0 {
            numberCopy = numberCopy/10
            digitCount += 1
        }

        return digitCount
    }

    func power(base: Int, power: Int) -> Int {
        var number = base
        for _ in 0..<power {
            number = number * base
        }

        return number
    }
}



print(RadixSort().radixSort(array: [5, 67, 3, 1, 89, 100, 34, 78, 23, 103]))
