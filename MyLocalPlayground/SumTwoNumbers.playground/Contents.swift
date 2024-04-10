func hasPairWithSum2(_ arr: [Int], _ sum: Int) -> Bool {
    var mySet = Set<Int>()
    for num in arr {
        if mySet.contains(num) {
            return true
        }
        mySet.insert(sum - num)
        print(mySet)
    }
    return false
}

print(hasPairWithSum2([6,4,3,2,1,7], 9))
