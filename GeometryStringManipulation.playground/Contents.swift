import Foundation

// HW1 - Add a Point structure. Overload subtraction, division, and multiplication operators.

struct Point {
    var x: Int
    var y: Int
}

func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}

// HW2 - Add a Size structure. Width and height (Int). Create a Rectangle structure containing a point and a size. Overload addition and subtraction operators for two rectangles.

struct Size {
    var height: Int
    var length: Int
}

struct Rectangle {
    var origin: Point
    var size: Size
}

var p1 = Point(x: 10, y: 20)
var p2 = Point(x: 7, y: 5)
var dimensions = Size(height: 3, length: 3)
var rectangle1 = Rectangle(origin: p1, size: dimensions)
var rectangle2 = Rectangle(origin: p2, size: dimensions)

func + (a: Rectangle, b: Rectangle) -> Rectangle {
    let newX = a.origin.x + b.origin.x
    let newY = a.origin.y + b.origin.y
    let newPoint = Point(x: newX, y: newY)
    
    let newHeight = a.size.height + b.size.height
    let newLength = a.size.length + b.size.length
    let newSize = Size(height: newHeight, length: newLength)
    
    return Rectangle(origin: newPoint, size: newSize)
}

// HW3 - Add a couple of operators for string manipulation. (+=) for a string that will append an integer to the string. And create an operator that takes the original and new strings and if the characters match, make them uppercase.

infix operator ~~: AdditionPrecedence

func ~~ (a: inout String, b: Int) {
    a = a + "\(b)"
}

infix operator ||||: AdditionPrecedence

func |||| (a: inout String, b: String) {
    var oldSymbolsArray = Array(a)
    var newSymbolsArray = Array(b)
    var final = ""
    
    for i in 0..<oldSymbolsArray.count {
        var checkA = String(newSymbolsArray[i]).capitalized
        var checkB = String(oldSymbolsArray[i]).capitalized
        
        if checkA == checkB {
            final += checkA
        } else {
            final += String(oldSymbolsArray[i])
        }
    }

    print(final)
}

var string1 = "TeSt"
var string2 = "tEsSt"

string1 |||| string2
