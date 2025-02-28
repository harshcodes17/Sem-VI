// Assignment No 6: Class, Inheritance, Collection and Loops

// 1. Create a class Car with properties
class Car {
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

// Create a Car object and print details
let myCar = Car(brand: "Toyota", model: "Corolla", year: 2020)
print("Car Details: \(myCar.brand) \(myCar.model) (\(myCar.year))")

// 2. Modify the Car class with displayDetails() method and computed property
class ImprovedCar {
    var brand: String
    var model: String
    var year: Int
    
    var carAge: Int {
        return 2025 - year // Current year (2025) minus car's year
    }
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    func displayDetails() {
        print("Car Details:")
        print("Brand: \(brand)")
        print("Model: \(model)")
        print("Year: \(year)")
        print("Age: \(carAge) years")
    }
}

let myImprovedCar = ImprovedCar(brand: "Honda", model: "Civic", year: 2018)
myImprovedCar.displayDetails()

// 3. Create ElectricCar subclass that inherits from Car
class ElectricCar: Car {
    var batteryCapacity: Double // in kWh
    
    init(brand: String, model: String, year: Int, batteryCapacity: Double) {
        self.batteryCapacity = batteryCapacity
        super.init(brand: brand, model: model, year: year)
    }
    
    func displayDetails() {
        print("Electric Car Details:")
        print("Brand: \(brand)")
        print("Model: \(model)")
        print("Year: \(year)")
        print("Battery Capacity: \(batteryCapacity) kWh")
        print("Car Age: \(2025 - year) years")
    }
}

let myElectricCar = ElectricCar(brand: "Tesla", model: "Model 3", year: 2021, batteryCapacity: 75.0)
myElectricCar.displayDetails()

// 4. Create Animal class and Dog subclass
class Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Dog: Animal {
    var breed: String
    
    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, age: age)
    }
}

let myDog = Dog(name: "Buddy", age: 3, breed: "Golden Retriever")
print("Dog Details: \(myDog.name), \(myDog.age) years old, \(myDog.breed)")

// 5. Create Laptop class and GamingLaptop subclass
class Laptop {
    var brand: String
    var processor: String
    var ramSize: Int // in GB
    
    init(brand: String, processor: String, ramSize: Int) {
        self.brand = brand
        self.processor = processor
        self.ramSize = ramSize
    }
}

class GamingLaptop: Laptop {
    var graphicsCard: String
    
    init(brand: String, processor: String, graphicsCard: String, ramSize: Int = 16) {
        self.graphicsCard = graphicsCard
        super.init(brand: brand, processor: processor, ramSize: ramSize)
    }
}

let myGamingLaptop = GamingLaptop(brand: "ASUS", processor: "Intel i9", graphicsCard: "NVIDIA RTX 3080")
print("Gaming Laptop Details:")
print("Brand: \(myGamingLaptop.brand)")
print("Processor: \(myGamingLaptop.processor)")
print("RAM: \(myGamingLaptop.ramSize) GB")
print("Graphics Card: \(myGamingLaptop.graphicsCard)")

// 6. Check if integers are in an array
var numbers = [1, -3, 50, 72, -95, 115]
print("Is 72 in the array? \(numbers.contains(72))")
print("Is 95 in the array? \(numbers.contains(95))")

// 7. Create an array of 20 elements with default value 0
var myArray = Array(repeating: 0, count: 20)
print("myArray elements: \(myArray)")

// 8. Check if array is empty and count elements
var fruits = ["Apple", "Banana", "Orange", "Mango", "Strawberry"]
if fruits.isEmpty {
    print("The fruits array is empty.")
} else {
    print("The fruits array contains \(fruits.count) elements.")
}

// 9. Array operations
var cricketers = ["Sachine", "Rahul", "Rohit", "Virat"]

// Update "Sachine" with "Yuvraj"
if let index = cricketers.firstIndex(of: "Sachine") {
    cricketers[index] = "Yuvraj"
}

// Add "Shubhaman" using append method
cricketers.append("Shubhaman")

// Add ["Ravindra", "Hardik"] using + operator
cricketers = cricketers + ["Ravindra", "Hardik"]

// Insert "Suresh" at position 5
cricketers.insert("Suresh", at: 4)

// Remove name at position 4
let removedAtPosition4 = cricketers.remove(at: 3)

// Remove last cricketer
let removedLast = cricketers.removeLast()

// Display cricketers
print("Cricketers array: \(cricketers)")

// 10. Create nameAge array with cricketers and ages
let cricketersArray = ["Rohit", "Virat", "Rahul", "Suresh", "Ravindra"]
let agesArray = [36, 35, 32, 37, 35]
let nameAge = [cricketersArray, agesArray]

// Display name and age of first cricketer
print("First cricketer: \(nameAge[0][0]), Age: \(nameAge[1][0])")

// 11. Create a dictionary and display details
var scores = ["Sachine": 50000, "Hardik": 4000, "Ravindra": 8000]
print("Scores Dictionary:")
for (name, score) in scores {
    print("\(name): \(score)")
}

// 12. Add and update dictionary values
// Add "Virat" with 25000
scores["Virat"] = 25000

// Update score of Hardik and display old score
let oldScoreHardik = scores["Hardik"]
scores["Hardik"] = 9000
print("Old score of Hardik: \(oldScoreHardik ?? 0)")
print("New score of Hardik: \(scores["Hardik"] ?? 0)")

// 13. Remove Sachine and print remaining elements
if let sachineScore = scores.removeValue(forKey: "Sachine") {
    print("Sachine's score at the time of deletion: \(sachineScore)")
}
print("Remaining scores:")
for (name, score) in scores {
    print("\(name): \(score)")
}

// 14. Create two separate arrays from dictionary
let namesArray = Array(scores.keys)
let scoresArray = Array(scores.values)
print("Names Array: \(namesArray)")
print("Scores Array: \(scoresArray)")

// 15. Print city names using for loop
let cities = ["New York", "London", "Tokyo", "Paris", "Sydney"]
print("Cities:")
for city in cities {
    print(city)
}

// 16. Calculate factorial using for loop
let number = 5
var factorial = 1
for i in 1...number {
    factorial *= i
}
print("Factorial of \(number) is \(factorial)")

// 17. Display dictionary using for loop
let vehicles = ["unicycle": 1, "bicycle": 2, "tricycle": 3, "quad bike": 4]
for (vehicle, wheels) in vehicles {
    print("\(vehicle) - has - \(wheels) wheels")
}

// 18. Check if a number is prime using while loop
func isPrime(_ num: Int) -> Bool {
    if num <= 1 {
        return false
    }
    if num <= 3 {
        return true
    }
    if num % 2 == 0 || num % 3 == 0 {
        return false
    }
    
    var i = 5
    while i * i <= num {
        if num % i == 0 || num % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

let numberToCheck = 17
if isPrime(numberToCheck) {
    print("\(numberToCheck) is Prime")
} else {
    print("\(numberToCheck) is Not prime")
}

// 19. Reverse an integer using while loop
func reverseInteger(_ num: Int) -> Int {
    var number = num
    var reversed = 0
    
    while number != 0 {
        let digit = number % 10
        reversed = reversed * 10 + digit
        number /= 10
    }
    
    return reversed
}

let numToReverse = 1234
let reversedNum = reverseInteger(numToReverse)
print("Reversed \(numToReverse) is \(reversedNum)")

// 20. Check if a number is an Armstrong number
func isArmstrong(_ num: Int) -> Bool {
    // Count number of digits
    var temp = num
    var digits = 0
    while temp > 0 {
        digits += 1
        temp /= 10
    }
    
    // Calculate sum of digits raised to power of number of digits
    temp = num
    var sum = 0
    while temp > 0 {
        let digit = temp % 10
        sum += Int(pow(Double(digit), Double(digits)))
        temp /= 10
    }
    
    return sum == num
}

let armstrongToCheck = 153
if isArmstrong(armstrongToCheck) {
    print("\(armstrongToCheck) is an Armstrong number")
} else {
    print("\(armstrongToCheck) is not an Armstrong number")
}