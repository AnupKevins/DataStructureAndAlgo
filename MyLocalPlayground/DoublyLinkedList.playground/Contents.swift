class Node {
    var value: Int
    var next: Node?
    var prev: Node?
    init(value: Int, next: Node? = nil, prev: Node? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

class DoublyLinkedList {
    var head: Node?
    var tail: Node?
    var length: Int
   
    init(value: Int) {
        let newNode = Node(value: value)
        self.head = newNode
        self.tail = newNode
        self.length = 1
    }
    
    // append is like a push at last
    // Since this is tail-end insertion, our new node is also the tail of the list.
    // And the head 'next' address was pointing to the same tail address
    // so the tail  becomes head next object
    //      LinkedList =   (
    //                      head: (
    //                              value: 6,
    //                               next: (
    //                                  value: 9,
    //                                  next: (
    //                                  value: 12,
    //                                  next: nil
    //                                  )
    //                              ),
    //                          tail: (
    //                           value: 12,
    //                           next: nil
    //                          ),
    //                          length: 2
    //                         )
    func append(value: Int) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.prev = tail
            tailNode.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        
        self.length += 1
    }
    
    func prepend(value: Int) {
        let newNode = Node(value: value)
        
        newNode.next = head
        head?.prev = newNode
        head = newNode
        
        self.length += 1
        
    }
    
    func printList() -> Array<Any> {
        var array: Array = [Int]()
        var currentNode = head
        while currentNode != nil {
            if let value = currentNode?.value {
                array.append(value)
                currentNode = currentNode?.next
            }
        }
        return array
    }
    
    func insert(value: Int, index: Int) {
        
        if index >= length {
            append(value: value)
            return
        }
        
        if index == 0 {
            prepend(value: value)
            return
        }
        
        var leaderNode = transverseToIndex(index: index - 1) //(value: 9, next: (value: 12,next: nil))
        
        var follower = leaderNode?.next//it holds (value: 12,next: nil)
        
        let newNode = Node(value: value)
        
        newNode.prev = leaderNode
        
        newNode.next = follower
        
        leaderNode?.next = newNode
        
        follower?.prev = newNode
        
        length += 1
    }
    
    func remove(index: Int) {
        
        let leaderNode = transverseToIndex(index: index - 1)
        
        let unwantedNode = leaderNode?.next
        
        leaderNode?.next = unwantedNode?.next
        
        length -= 1
    }
    
    func transverseToIndex(index: Int) -> Node? {
        
        var counter = 0
        var currentNode = head
        
        while counter != index {
            currentNode = currentNode?.next
            counter += 1
        }
        
        return currentNode
    }
}

let linkedList = DoublyLinkedList(value: 6)

linkedList.append(value: 9)

linkedList.append(value: 15)

linkedList.prepend(value: 3)

linkedList.insert(value: 12, index: 3)

print(linkedList.printList())

//
//linkedList.insert(value: 1, index: 0)


// print(linkedList.printList())

//linkedList.remove(index: 3)
//
//print(linkedList.printList()) // 9 is removed
