import Foundation

// MARK: - Student Struct

struct Student {
    // Name and surname properties, capitalized when set
    var name: String {
        didSet {
            name = name.capitalized
        }
    }
    
    var surname: String {
        didSet {
            surname = surname.capitalized
        }
    }
    
    var fullName: String {
        // Computed property for full name
        get {
            return name + " " + surname
        }
        set {
            let components = newValue.components(separatedBy: " ")
            // Update name and surname from full name string
            name = components.first ?? ""
            surname = components.count > 1 ? components.last ?? "" : ""
        }
    }
    
    var birth: Date // Date of birth
}

// MARK: - Date Struct

struct Date {
    var day: Int
    var month: Int
    var year: Int
    
    var age: Int {
        // Calculate age based on current year
        let currentYear = Calendar.current.component(.year, from: Date())
        return currentYear - year
    }
}

// MARK: - Otrezok Struct

struct Otrezok {
    var a: Int
    var b: Int
    
    var midPoint: Int {
        // Calculate midpoint of the segment
        return (a + b) / 2
    }
    
    var length: Int {
        // Calculate length of the segment
        return b - a
    }
}

// MARK: - Human Class

class Human {
    var name: String {
        didSet {
            // Limit name length
            if name.count > MaxNameLength {
                name = String(oldValue.prefix(MaxNameLength))
            }
        }
    }
    
    var age: Int {
        didSet {
            // Limit age
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    // Stored property for the story
    lazy var storyOfMyLife: String! = "This is a story of my entire life..."
    
    // Computed property for max age
    class var maxAge: Int {
        return 100
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// MARK: - Direction Enum

enum Direction {
    static let enumDescription = "Directions in the game"
    case left
    case right
    case top
    case bottom
    
    var isVertical: Bool {
        return self == .top || self == .bottom
    }
    
    var isHorizontal: Bool {
        return !isVertical
    }
}

// MARK: - Cat Struct

struct Cat {
    var name: String {
        didSet {
            // Limit name length
            if name.count > MaxNameLength {
                name = String(oldValue.prefix(MaxNameLength))
            }
        }
    }
    
    static let maxAge = 20 // Max age for cats
    static var totalCats = 0 // Total number of cats
    
    var age: Int {
        didSet {
            // Limit age
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        Cat.totalCats += 1 // Increment total cats
    }
}

// MARK: - File Description Struct

enum FileType {
    case open
    case closed
}

struct FileDescription {
    let filename: String
    var fileSize: Double {
        didSet {
            // Limit file size
            if fileSize > maxWeight {
                fileSize = oldValue
            }
        }
    }
    let folderPath: String
    lazy var type: FileType = .open
    let fileContent: String?
}

// MARK: - Constants

let MaxNameLength = 50 // Maximum length for name
let maxWeight = 10.0 // Maximum weight for files

// MARK: - Test

// Testing the improved code
var loh = Student(name: "Test", surname: "Sets", birth: Date(day: 25, month: 8, year: 1999))
loh.fullName = "Ebat Kopat"
loh.birth.age // Get age

var otrcheck = Otrezok(a: 20, b: 31)
otrcheck.length // Get length

let human = Human(name: "Peter", age: 30)
human.storyOfMyLife

var cat = Cat(name: "Whiten", age: 10)
Cat.totalCats // Total number of cats

let file1 = FileDescription(filename: "Eb", fileSize: 3, folderPath: "Users/PrivateFiles", fileContent: "This is Text file, check it")

var guy1 = Human(name: "Matvey", age: 10)
guy1.age = 1000
guy1
