class Node {
    var value: Int
    var next: Node?
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
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
        
        var holdingPointer = leaderNode?.next//it holds (value: 12,next: nil)
        
        let newNode = Node(value: value)
        
        newNode.next = holdingPointer
        
        leaderNode?.next = newNode
        
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
    // This process effectively reverses the order of elements in the linked list by manipulating the pointers between nodes.
    func reverse() {
        
        if (head?.next == nil) {
            return
        }
        
        var first = head // first = 6
        tail = head // tail = 6
        var second = head?.next // second = 9
        while ((second) != nil) { // while(9) // while(15)
            // temp is used to store the next node after second.
            let temp =  second?.next // temp = 15  // temp = nil
            
            // consider the arrow [ 6 -> 9 -> 15 ]
            // -> is the second?.next so for 9 arraors reverse to first like [ 6 <- 9 ] in first loop
            // then in second loop [ 9 <- 15 ]
            // The next pointer of second is set to point back to first, effectively reversing the direction of the pointer.
            second?.next = first // second?.next = 6 // second?.next = 9
            
            // first is moved one step forward in the list.
            first = second // first = 9 // first = 15
            
            //second is moved one step forward in the list, using the stored reference in temp.
            second = temp // second = 15 // second = nil
        }
        
        self.head?.next = nil
        head = first // head = 15
    }
}

let linkedList = LinkedList(value: 6)

linkedList.append(value: 9)

linkedList.append(value: 15)

//linkedList.prepend(value: 3)
//
//linkedList.insert(value: 12, index: 3)
//
//linkedList.insert(value: 1, index: 0)

print(linkedList.printList())

linkedList.reverse()

print(linkedList.printList())
//
//linkedList.remove(index: 3)
//
//print(linkedList.printList()) // 9 is removed
