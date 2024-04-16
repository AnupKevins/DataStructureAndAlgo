class Node<T> {
    var value: T?
    var next: Node<T>?
    
    init(value: T? = nil) {
        self.value = value
    }
}

class QueueImplementation<T> {
    var first: Node<T>?
    var last: Node<T>?
    var length: Int
    
    init() {
        self.first = nil
        self.last = nil
        self.length = 0
    }
    
    func peek() -> Node<T>? {
        return first
    }
    
    func enqueue(value: T) {
        
        let newNode = Node(value: value)
        
        if length == 0 {
            first = newNode
            last = newNode
        } else {
            last?.next = newNode
            last = newNode
        }
        
        length += 1
        
    }
    
    func dequeue() -> Node<T>? {
        if (first == nil) {
            return nil
        }
        
        if (first === last) {
            last = nil
        }
        
        let dequeuedNode = first
        first = dequeuedNode?.next
        length -= 1
        
        return dequeuedNode
    }
}


let queue = QueueImplementation<Any>()
queue.enqueue(value: "Cat")
queue.enqueue(value: 100)
queue.enqueue(value: "Dog")
queue.enqueue(value: 200)
queue.dequeue()
queue.peek()
