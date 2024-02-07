import Foundation

// HW1 - Extend the Int type and add two methods: isPositive and isNegative.
// isPositive returns true if the integer is positive, otherwise false.
// isNegative returns true if the integer is negative, otherwise false.
// Add a method noly() which returns true if the integer is 0, otherwise false.

// MW2 - Add a method (a property of the computer) that returns the number of digits in the integer.
// For example, if the integer is 1, it returns 1; if it's 1000, it returns 4 digits.

// HW3 - Add a subscript that returns the digit at a specified index (similar to an array).
// For example, for 317: index 0 returns 7, index 1 returns 1, index 2 returns 3.

// HW4 - Modify the subscript so that it also allows setting values.
// The setter should change the value of the integer accordingly.


extension Int {
    func isPositive() -> Bool {
        return self > 0
    }
    
    func isNegative() -> Bool {
        return self < 0
    }
    
    func noly() -> Bool {
        return self == 0
    }
    
    subscript(index: Int) -> Int {
        get {
            let numberString = String(self)
            guard index < numberString.count else {
                print("Index is greater than the number of digits")
                return 0
            }
            return Int(String(numberString[numberString.index(numberString.startIndex, offsetBy: index)])) ?? 0
        }
        
        set {
            var digits = String(self).compactMap { Int(String($0)) }
            guard index < digits.count else {
                print("Index is greater than the number of digits")
                return
            }
            digits[index] = newValue
            let newNumber = digits.reduce("") { $0 + String($1) }
            self = Int(newNumber) ?? 0
        }
    }
}

extension String {
    func trankeys(howLong: Int) -> String {
        guard howLong < count else {
            print("The specified length is longer than the string")
            return self
        }
        let substring = prefix(howLong)
        if count > howLong {
            return substring + "..."
        } else {
            return substring
        }
    }
}

var number: Int = 3234222

number.isNegative() // Output: false
number.isPositive() // Output: true
number.noly() // Output: false

number[0] = 1 // Change the digit at index 0 to 1
print(number) // Output: 1234222

var string = "oosoo"
print(string.trankeys(howLong: 4)) // Output: "ooso"
