// Given 2 arrays, create a function that let's a user know (true/false) whether these two arrays contain any common items
//For Example:
//const array1 = ['a', 'b', 'c', 'x'];//const array2 = ['z', 'y', 'i'];
//should return false.
//-----------
//const array1 = ['a', 'b', 'c', 'x'];//const array2 = ['z', 'y', 'x'];
//should return true.

// 2 parameters - arrays - no size limit
// return true or false

func containsCommonItem2(_ arr1: [Any],_ arr2: [Any]) -> Bool {
    var map = [AnyHashable: Bool]()
    for item in arr1 {
        if let key = item as? AnyHashable {
            print(key)
            map[key] = true
            print(map)
        }
    }
    
    for item in arr2 {
        if let key = item as? AnyHashable, map[key] == true {
            return true
        }
    }
    
    return false
}

let array1: [Any] = [1, 1, 4]
let array2: [Any] = [5, 1, 7, 8]
print(containsCommonItem2(array1, array2))

///////////////////////////////// using generic but dont work with string and int together
func containsCommonItem<T: Hashable>(_ arr1: [T],_ arr2: [T]) -> Bool {
    var map = [T: Bool]()
    for item in arr1 {
        map[item] = true
    }
    
    for item in arr2 {
        if map[item] == true {
            return true
        }
    }
    
    return false
}

let array1a = [1, 1, 4]
let array2a = ["1", "7", "8"]
print(containsCommonItem(array1a, array2a))
