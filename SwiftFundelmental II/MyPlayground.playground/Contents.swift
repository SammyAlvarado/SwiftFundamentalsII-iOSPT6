// Enum - Enumeration -- its simailar to a struct pre defide categories. It helps prevent user erros

enum AppleProducts: String {
    case iPhone
    case iPad
    case watch = "Apple Watch" // Raw Value
}

enum PizzzaCategory: String {
    case classic
    case speciality
    case glutenFree
}

let specialtiyPizza = PizzzaCategory.speciality

let myFavoritePiza: PizzzaCategory = .classic

print(myFavoritePiza)


//Strutcts , Is there a limit to create case?

struct Pizza {
    let name: String
    let cost: Double
    let category: PizzzaCategory
}




let myPizza = Pizza(name: "49-er", cost: 12.99, category: .classic)
//let secondPizza = Pizza (name: <#T##String#>, cost: <#T##Double#>, category: <#T##PizzzaCategory#>)

print("I would like to order a \(myPizza.name)")

class PizzaPlace { // Blue print of a pizza place object
    var name: String
    var address: String
    private(set) var pizzas: [Pizza] // model contollers ? this will help restrect other classes to limit the changes
    
    // Create Initializer
    init(name: String, address: String) {
        self.name = name
        self.address = address
        self.pizzas = []
    }
    
//    method is a function in side of a class
    
    func add(pizza: Pizza) {
        pizzas.append(pizza)
    }
}


let johnnyPizzaPlace = PizzaPlace(name: "Johnny's Pizza", address: "123 Delicious")   // This is like the building

let hawaiianClassic = Pizza(name: "hw", cost: 12.99, category: .classic)

let chickenAlfredo = Pizza(name: "Call Me Mr. Alfredo", cost: 15.99, category: .speciality)

let margarita = Pizza(name: "Margarita Senioritz", cost: 16.99, category: .glutenFree)


johnnyPizzaPlace.add(pizza: hawaiianClassic)
johnnyPizzaPlace.add(pizza: chickenAlfredo)
johnnyPizzaPlace.add(pizza: margarita)

// Difference between Values Types and Reference Types
// Structs = Values Type

struct Tickets {
    var name: String
}

var ticket = Tickets(name: "Bob")
print(ticket.name)

var ticketCopy = ticket

ticketCopy.name = "johnny"

print("ticket: \(ticket.name)") // 8:33 look again
print("ticketCopy: \(ticketCopy.name)")


//func changeTicketName(ticket: Ticket) {
//    var updatedTicket = ticket
//    updatedTicket.name = "John"
//    print("updatedTicket: \(updatedTicket.name)")
//}

//print("Ticket: \(ticket.name)")
//changeTicketName(ticket: ticket)

// Reference Types: class

class City {
    var name: String
    var population: Int
    
    init(name: String, population: Int) {
        self.name = name
        self.population = population
    }
}

//
//let rochester = City(name: "Rochester,NY", poplulations: 208_000)

//let roc = rochester
//
//roc.name = "ROC"
//
//print("rochester: \(rochester.name)")
//print("roc: \(roc.name)")


func increasePopulation(city: City) {
    city.population = city.population + 1
}


//print ("Rochester popluations \()")


//Custoem class

class Vacuum {
    var isOn: Bool
    var isPluggedIn: Bool
    var rugHight: Int
    var isSelfDriving: Bool
    var attachments: [String]
    
    init(isSelfDriving: Bool = false, attachments: [String] = []) {
        self.isOn = false
        self.isPluggedIn = false
        self.rugHight = 5
        self.isSelfDriving = isSelfDriving
        self.attachments = attachments
    }
}


let sharkVaccum = Vacuum(isSelfDriving: false, attachments: ["Dusting Brush", "Crebice Tool"])

let roombaVacuum = Vacuum(isSelfDriving: true)
print(roombaVacuum.attachments)


// Optionals - means it could be nil and not carry a value. You can look at this as a place holder until enduser fill in value

var myString: String? = "myString"

//if your work is close and you dont  own a car:

var myCar: String? = nil

// I changed jobs and now I do have a car

myCar = "Subur"


// I get a into a accident and total my car
myCar = nil


// I got insurece money to get another car

myCar = "Tesla"

// I have 4 kids and have to get rid of tesla

myCar = "Toyota Sienna"


let weight = Int("123") // why is this option nil?

print(weight)


// if let statment to unwrap an optiional value
let subtotalString = "58.95"

//if let subtotal  = Float(subtotalString) {
//    let tip = subtotal * 0.20
//    let total = subtotal + tip
//    print("Total: \(total)\n\tsubtotal: \(subtotal)\n\ttip: \(tip)")
//} else {
//    print("\(subtotalString) is not a valid amount")
//}



func calculateTip(totalString: String) {
    if let subtotal  = Float(totalString) {
        let tip = subtotal * 0.20
        let total = subtotal + tip
        print("Total: \(total)\n\tsubtotal: \(subtotal)\n\ttip: \(tip)")
    } else {
        print("\(totalString) is not a valid amount")
    }
}

calculateTip(totalString: "200")
calculateTip(totalString: "abc")

// Force Unwarp - only done when values is not nil

//var yearsOld: Int? = nil

var yearsOld: Int? = 35

let approximateDaysOld = 365 * yearsOld!
print("wow! you are \(approximateDaysOld) days Old.")

if yearsOld != yearsOld {
    let approximateDaysOld = 365 * yearsOld!
    print("Wow your are \(approximateDaysOld) days old. ")
} else {
    print("You dont't have an age")
}
