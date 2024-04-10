func reverseString(str: String) -> String {
    var backwardString = ""
    
    for i in stride(
        from: str.count - 1,
        through: 0,
        by: -1
    ) {
        let index = str.index(str.startIndex, offsetBy: i)
        backwardString.append(str[index])
    }
    
    return backwardString
}

reverseString(str: "How are you doing")
