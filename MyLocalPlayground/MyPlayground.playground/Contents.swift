class HashTable {
    var data: [[(String, Int)?]]
    
    init(size: Int) {
        self.data = Array(repeating: [], count: size)
    }
    
    private func hash(_ key: String) -> Int {
        var hash = 0
        for (index, char) in key.enumerated() {
            hash = (hash + Int(char.asciiValue ?? 0) * index) % self.data.count
        }
        return hash
    }
    
    func set(key: String, value: Int) {
        let address = self.hash(key)
        if self.data[address].isEmpty {
            self.data[address] = [(key, value)]
        } else {
            var found = false
            for (index, element) in self.data[address].enumerated() {
                if let element = element, element.0 == key {
                    self.data[address][index] = (key, value)
                    found = true
                    break
                }
            }
            if !found {
                self.data[address].append((key, value))
            }
        }
    }
    
    func get(key: String) -> Int? {
        let address = self.hash(key)
        for element in self.data[address] {
            if let element = element, element.0 == key {
                return element.1
            }
        }
        return nil
    }
}

let myHashTable = HashTable(size: 50)
myHashTable.set(key: "grapes", value: 10000)
myHashTable.get(key: "grapes")
myHashTable.set(key: "apples", value: 9)
myHashTable.get(key: "apples")
