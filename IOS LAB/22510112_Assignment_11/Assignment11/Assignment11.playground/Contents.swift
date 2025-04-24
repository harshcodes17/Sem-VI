import UIKit

// Task 1: Calculate area of a rectangle with guard
func calculateArea(x: Double, y: Double) -> Double? {
    guard x > 0, y > 0 else {
        return nil
    }
    return x * y
}
// Calls
let areaPositive = calculateArea(x: 5, y: 10)     
let areaNegative = calculateArea(x: -5, y: 10)   
print("areaPositive = \(areaPositive as Any), areaNegative = \(areaNegative as Any)")

// Task 2: Add two optional Ints with guard
func add(_ a: Int?, _ b: Int?) -> Int? {
    guard let a = a, let b = b else {
        return nil
    }
    return a + b
}
// Calls
let sumValid = add(3, 4)     // 7
let sumInvalid = add(nil, 4) // nil
print("sumValid = \(sumValid as Any), sumInvalid = \(sumInvalid as Any)")

// Task 3: createUser() unwrapping UITextField.text
struct User {
    var firstName: String
    var lastName: String
    var age: String
}
let firstNameTextField = UITextField(); firstNameTextField.text = "Harsh"
let lastNameTextField = UITextField();  lastNameTextField.text  = "Bamane"
let ageTextField = UITextField();       ageTextField.text       = "21"

func createUser() -> User? {
    guard let first = firstNameTextField.text,
          let last  = lastNameTextField.text,
          let age   = ageTextField.text else {
        return nil
    }
    return User(firstName: first, lastName: last, age: age)
}

// Task 4: Call createUser and unwrap
if let user = createUser() {
    print("Created user: \(user.firstName) \(user.lastName), age \(user.age)")
} else {
    print("Failed to create user")
}

// Task 5-7: Workout struct with failable initializer using guard
struct Workout {
    var startTime: Double
    var endTime: Double

    init?(startTime: Double, endTime: Double) {
        guard abs(endTime - startTime) > 10 else {
            return nil
        }
        self.startTime = startTime
        self.endTime   = endTime
    }
}
// Examples
let w1 = Workout(startTime: 0, endTime: 20)  // valid
let w2 = Workout(startTime: 0, endTime: 5)   // nil
print("w1 = \(w1 as Any), w2 = \(w2 as Any)")

// Task 8: logFood() unwrapping text & converting to Int
struct Food {
    var name: String
    var calories: Int
}
let foodTextField      = UITextField(); foodTextField.text      = "Banana"
let caloriesTextField = UITextField(); caloriesTextField.text = "23"

func logFood() -> Food? {
    guard let name       = foodTextField.text,
          let calText    = caloriesTextField.text,
          let calories   = Int(calText) else {
        return nil
    }
    return Food(name: name, calories: calories)
}
// Task 9: Call logFood
if let snack = logFood() {
    print("Food: \(snack.name), calories: \(snack.calories)")
} else {
    print("Failed to log food")
}
// If caloriesTextField.text = "abc", calories initializer fails and returns nil

// Task 10: Scope error explanation
// The print below errors because 'foo' is declared inside the loop and not visible outside.
// for _ in 0..<10 { let foo = 55; print(foo) }
// print(foo) // ERROR: 'foo' not in scope

// Task 11: 'x' defined outside, so both prints compile and x is visible inside and after the loop.
var x = 10
for _ in 0..<3 {
    x += 1
    print("Inside loop: x = \(x)")
}
print("After loop: x = \(x)")

// Task 12: greeting with variable shadowing
func greeting(greeting: String?, name: String) {
    guard var greeting = greeting else {
        print("Hello, \(name).")
        return
    }
    // shadowed greeting non-nil here
    print("\(greeting), \(name).")
}
// Calls
greeting(greeting: "Hi there", name: "Vishal")  
greeting(greeting: nil, name: "Vishnavi")           

// Task 13: Car class with shadowed initializer parameters
class Car {
    var make: String
    var model: String
    var year: Int

    init(make: String, model: String, year: Int) {
        self.make  = make
        self.model = model
        self.year  = year
    }
}
let car = Car(make: "Toyota", model: "Corolla", year: 2020)
print(car)

// Task 14-15: getWinner fix
struct StepUser {
    var name: String
    var stepsToday: Int
}
let competitors = [
    StepUser(name: "StepMaster",  stepsToday: 8394),
    StepUser(name: "ActiveSitter", stepsToday: 9132),
    StepUser(name: "MonsterWalker",stepsToday: 7193)
]

func getWinner(competitors: [StepUser]) -> StepUser? {
    var top: StepUser?
    for competitor in competitors {
        if let currentTop = top {
            if competitor.stepsToday > currentTop.stepsToday {
                top = competitor
            }
        } else {
            top = competitor
        }
    }
    return top
}
if let winner = getWinner(competitors: competitors) {
    print("Winner is \(winner.name)") // ActiveSitter
}

// Task 16-17: Memberwise & failable initializer in User struct
extension StepUser {
    // Memberwise (redundant in struct, shown explicitly)
    init(name: String, stepsToday: Int) {
        self.name = name; self.stepsToday = stepsToday
    }
    // Failable initializer
    init?(name: String?, stepsToday: Int?) {
        guard let name = name, let steps = stepsToday else {
            return nil
        }
        self.name = name; self.stepsToday = steps
    }
}

// Task 18: Suit enum
enum Suit { case clubs, spades, diamonds, hearts }

// Task 19-20: cardInHand updates
var cardInHand: Suit = .hearts
print("Drew: \(cardInHand)")
cardInHand = .spades
print("Drew now: \(cardInHand)")

// Task 21: getFortune based on suit
func getFortune(cardSuit: Suit) {
    switch cardSuit {
    case .clubs:
        print("Clubs: Community support is coming.")
    case .spades:
        print("Spades: A challenge will sharpen you.")
    case .diamonds:
        print("Diamonds: Wealth is on its way.")
    case .hearts:
        print("Hearts: Love blossoms soon.")
    }
}
getFortune(cardSuit: .clubs)
getFortune(cardSuit: .hearts)

// Task 22-23: Card struct with nested Value enum
struct Card {
    enum Value {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    var suit: Suit
    var value: Value
}
let card1 = Card(suit: .diamonds, value: .queen)
let card2 = Card(suit: .clubs,    value: .ace)
print("Card1: \(card1.value) of \(card1.suit)")
print("Card2: \(card2.value) of \(card2.suit)")
