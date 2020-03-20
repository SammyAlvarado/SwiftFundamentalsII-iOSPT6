import UIKit

//Objectives
//
//use guard let statement to early exit (return)
//use optionls chaining to short circuit evaluations when a value is  nil


//: ## use a guard let statement to early exit -- This allows you to abord if condition is not meet
// Guard is only good within the scope of a method of functions

// if let
var middleName: String? = "Doe"

if let unwrappedMiddleName = middleName {
    print(unwrappedMiddleName)
}


// guard let
func withdrawMoney(amountString: String) {
    // Verify that amount string can be number and is
    // greater than 0
    guard let amount = Double(amountString),
        amount > 0 else {
            print("Invalid amount to withdraw: \(amountString)")
            return
    }
        print("Processing request to withdrea \(amount) dollars from bank account")
}


withdrawMoney(amountString: "200")



//: ## use optional chaining to short circuit evalauation when a  value is nil

class Oven {
    func bakeFood() {
        print("Baking Food")
    }
}

class Kitchen {
    var oven: Oven?
    func sweepFloor() {
        print("Sweeping the Floor")
    }
}

var kitchen: Kitchen? = nil

kitchen?.sweepFloor()
kitchen?.oven?.bakeFood()

// If you create the kitchen, but don't have an ove, the
// kitchen can be swept,

kitchen = Kitchen()
kitchen?.sweepFloor()
kitchen?.oven = Oven()
kitchen?.oven?.bakeFood()


// **NOTE**: The down side is that nothing happens when the kitchen or the oven are not set with optionals chaining


//: ## Use the nil coalescing operator (??) to provide a dfault value when an expression is nil

let userInput: String = "noo"

let numberOFDoges = Int(userInput) ?? 0

print(numberOFDoges)


// Coming option al chainging and nil colaesing

var wordOfTheDay: String? = "Butterfly"

var numberOFletters = wordOfTheDay?.count ?? 0

print("The word of the day: \(wordOfTheDay ?? "") has \(numberOFletters) letters")


//:# use class inheritance and composition

class Shape {
    var color: String
    var position: CGPoint
    
    init(color: String, position: CGPoint = .zero) {
        self.color = color
        self.position = position
    }
}


class Square: Shape {
    var edgeWidth: Double
    
    init(color: String, edgeWidth: Double) {
        self.edgeWidth = edgeWidth
        super.init(color: color)
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(color: String, width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(color: color)
    }
}


// create instance of the types:

let shape = Shape(color: "Red")
let square = Square(color: "Blue", edgeWidth: 6)
let rectangle = Rectangle(color: "Yellow", width: 4, height: 14.2)

var shapes: [Shape] = []

shapes.append(contentsOf: [square, rectangle, shape])


for shape in shapes {
    print(shape.color)
}


// use the "is" Operator

let shape2: Shape = square

if shape2 is Square {
    print("square found")
}


//: ## downcast types from super classes to subclasses (as? adn as!)

//: ## as ? = optionals downscasting

for shape in shapes {
    if let square = shape as? Square {
        print(square.edgeWidth)
    } else if let rectangle = shape as? Rectangle {
        print(rectangle.height)
    } else {
        print(shape.color)
    }
}

var someShape: Shape
someShape = Rectangle(color: "Red", width: 50, height: 40)

let redRectangle = someShape as! Rectangle

print("It's an \(redRectangle.color) rectanlge!")

//print("Its an \(bronwRectanlge.color)")


