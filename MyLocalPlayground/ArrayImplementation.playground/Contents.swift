class MyArray {
    
    var length: Int
    var data: [Int: Any]
    
    init(length: Int, data: [Int:Any]) {
        self.length = length
        self.data = data
    }
    
    func getItem(index: Int) -> Any? {
        return self.data[index]
    }
    
    func push(item: Any) -> Int {
        self.data[self.length] = item
        self.length += 1
        return self.length
    }
    
    func pop() -> Any {
        
        self.data.removeValue(forKey: self.length - 1)
        self.length -= 1
        return self.data
    }
    
    func delete(index: Int) -> Any? {
        
        let item = self.data[index]
        shift(index: index)
        return item // just return the element
        
    }
    
    func shift(index: Int) {
        for i in index..<self.length {
            self.data[i] = self.data[i+1]
        }
        self.data.removeValue(forKey: self.length - 1)
        self.length -= 1
    }
 }

let myArray = MyArray(length: 0, data: [:])
myArray.push(item: "Hello")
myArray.push(item: "Anup")
myArray.push(item: "How")
myArray.pop()
myArray.delete(index: 1)
print(myArray.data)
