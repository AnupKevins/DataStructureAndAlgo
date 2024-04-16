import Foundation

class Node<T> {
    var value: T?
    var next: Node<T>?
    
    init(value: T? = nil) {
        self.value = value
        self.next = nil
    }
    
}
class Stack<T> {
    var top: Node<T>?
    var bottom: Node<T>?
    var length: Int
    
    init() {
        self.top = nil
        self.bottom = nil
        self.length = 0
    }
    
    func push(value: T) {
        let newNode = Node(value: value)
        
        if length == 0 {
            top = newNode
            bottom = newNode
        } else {
            let holdingPoint = top
            top = newNode
            top?.next = holdingPoint
        }
        length += 1
        
    }
    
    func pop() -> Node<T>? {
        
        if top == nil {
            return nil
        }
        if top === bottom {
            top = nil
            bottom = nil
            return nil
        }
        let poppedNode = top
        top = poppedNode?.next
        length -= 1
        return poppedNode
    }
    
    func peek() -> Node<T>? {
        return top
    }
}

let newStack = Stack<String>()
newStack.push(value: "Dog")
    

newStack.pop()

newStack.peek()
