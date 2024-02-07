struct Player {
    var height : Int
    var with : Int
}

struct Box {
    var height : Int
    var with : Int
}

struct Room {
    var height : Int
    var with : Int
}

struct GreenBox {
    var height : Int
    var with : Int
}

struct Game {
    var room : Room
    var box : Box
    var player : Player
    var greenBox: GreenBox
    
    //Borders Of The Box
    var bordersHeight = [Int : Bool]()
    var bordersWith = [Int : Bool]()

    
    var heightValue = [Int]()
    var withValue = [Int]()
    
    
    
    // Building Game in 1 Function
    mutating func buildRoom() {
        
        // Adding all fields
        for height in 1...room.height {
            heightValue.append(height)
        }
        for with in 1...room.with {
            withValue.append(with)
        }
        addBorders()
        
    }
        
    mutating func addBorders() {
        // Adding borders
        for height in 1...room.height {
            for with in 1...room.with {
                
                switch height {
                case 1, room.height:
                    bordersHeight.updateValue(true, forKey: height)
                default:
                    bordersHeight.updateValue(false, forKey: height)
                }
                
                switch with {
                case 1, room.with:
                    bordersWith.updateValue(true, forKey: with)
                default:
                    bordersWith.updateValue(false, forKey: with)
                }
            }
        }
    }
    
   
    // Printing board
    var allboard = ""
    var countBorders = 0
    mutating func printBoarrd() {
        
        buildRoom()
        
        for height in heightValue {
            
            if box.height == greenBox.height && box.with == greenBox.with {
                print("Game over! ✅")
                break
            }
            
            for with in withValue {
                
                // conunt new line
                switch countBorders {
                case room.with:
                    allboard.append("\n")
                    countBorders = 1
                default:
                    countBorders += 1
                }
                
                switch (height, with) {
                case (player.height, player.with):
                    allboard += " 🕵🏽 "
                case (box.height, box.with):
                    allboard += " 📦 "
                case (greenBox.height, greenBox.with):
                    allboard += " 🟩 "
                case (_, _) where bordersHeight[height] == true || bordersWith[with] == true:
                    allboard += " ⬛️ "
                default:
                    allboard += " ⬜️ "
                }
            }
        }
        print(allboard)
        
    }
    
    // Changing directions
    enum dir {
        case left
        case right
        case up
        case down
    }
    
    mutating func changeDirection(direction: dir) {
        
        addBorders()
        
        let checkbordersHeight = bordersHeight
        let checkbordersWith = bordersWith
        
        // Adding fields, where player can be, to move the box.
        switch direction {
        case .down:
            player.height += 1

            // Checking Borders
            if bordersHeight[player.height] == true {
                player.height -= 1
            }
            
        case .up:
            player.height -= 1
            
            // Checking Borders
            if bordersHeight[player.height] == true {
                player.height += 1
            }
            
        case .right:
            player.with += 1
            
            // Checking Borders
            if bordersWith[player.with] == true {
                player.with -= 1
            }
            
        case .left:
            player.with -= 1
            
            // Checking Borders
            if bordersWith[player.with] == true {
                player.with += 1
            }
        }
        
        // Moving Box
        var boxcheckL = box.with - 1
        var boxcheckR = box.with + 1
        var boxcheckUp = box.height - 1
        var boxcheckDown = box.height + 1
        
        // Checking borders for the Box
        switch (player.height, player.with) {
        case (boxcheckUp, box.with):
            box.height += 1
            
            if bordersHeight[box.height] ?? false {
                box.height -= 4
            }
        case (boxcheckDown, box.with):
            box.height -= 1
            
            if bordersHeight[box.height] ?? false {
                box.height += 4
            }
        case (box.height, boxcheckR):
            box.with -= 1
            
            if bordersWith[box.with] ?? false {
                box.with += 4
            }
        case (box.height, boxcheckL):
            box.with += 1
            
            if bordersWith[box.with] ?? false {
                box.with -= 4
            }
            
        default: ()
        }
    }
}



var addBoard = Room(height: 10, with: 10)
var addBox = Box(height: 5, with: 6)
var addPlayer = Player(height: 3, with: 5)
var addbox = GreenBox(height: 8, with: 3)

var gameCreate = Game(room: addBoard, box: addBox, player: addPlayer, greenBox: addbox)

// \/\/\/ Let's Play:  gameCreate.changeDirection(direction: . /Direction/ ) \/\/\/


gameCreate.changeDirection(direction: .right)


// /\/\/\           /\/\/\
// Printing Board

gameCreate.printBoarrd()
