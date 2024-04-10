//Google Question
//Given an array = [2,5,1,2,3,5,1,2,4]:
//It should return 2

//Given an array = [2,1,1,2,3,5,1,2,4]:
//It should return 1

//Given an array = [2,3,4,5]:
//It should return undefined

// Naive Solution
func firstRecurringCharacter(_ input: [Int]) -> Int? {
    for i in 0..<input.count {
        for j in (i + 1)..<input.count {
            if input[i] == input[j] {
                return input[i]
            }
        }
    }
    return nil
}

firstRecurringCharacter([2,1,1,2,3,5,1,2,4])


// Better Solution
// Time Complexity O(n)
// Space Complexity O(n)
func firstRecurringCharacter2(_ input: [Int]) -> Int? {
    var map = [Int:Int]()
    for (index, value) in input.enumerated() {
        // if 2 existed in map already then return
        // value is key
        if let valueExisted = map[value] {
           return valueExisted
        } else {
            map[value] = index // Value is the Key like
            // map[2] = 0
        }
       print(map)
    }
    return nil
}

firstRecurringCharacter2([2,1,1,2,3,5,1,2,4])



