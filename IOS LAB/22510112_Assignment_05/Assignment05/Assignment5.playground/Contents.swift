struct Book {
    var title: String
    var author: String
    var price: Double
    var yearPublished: Int
    
    func displayBook() {
        print("Book Details:")
        print("Title: \(title)")
        print("Author: \(author)")
        print("Price: $\(price)")
        print("Year Published: \(yearPublished)\n")
    }
}

struct Rectangle {
    var width: Double
    var height: Double
    
    func calcArea() -> Double {
        return width * height
    }
}

struct Temperature {
    var celsius: Double
    
    init(fahrenheit: Double) {
        celsius = (fahrenheit - 32) * 5/9
    }
}

struct Student {
    var name: String
    var rollNumber: Int
    var marks: Double
    
    init() {
        name = "Unknown"
        rollNumber = 0
        marks = 0.0
    }
}

struct Smartphone {
    var brand: String
    var model: String
    var storageGB: Int
    var price: Double
}

struct BankAccountWithMin {
    var accountHolder: String
    var balance: Double
    
    init(accountHolder: String, balance: Double) {
        self.accountHolder = accountHolder
        self.balance = max(balance, 500.0)
    }
}

struct CarDetails {
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int = 2025) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

struct BankAccount {
    var accountHolder: String
    var balance: Double
    
    mutating func deposit(amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
        } else {
            print("Insufficient funds")
        }
    }
}

struct Car {
    var fuelLevel: Double
    var mileage: Double
    
    mutating func refuel(amount: Double) {
        let newLevel = fuelLevel + amount
        fuelLevel = min(newLevel, 100.0)
    }
    
    mutating func drive(distance: Double) {
        let fuelConsumed = distance / mileage
        if fuelLevel >= fuelConsumed {
            fuelLevel -= fuelConsumed
        } else {
            print("Insufficient fuel for this distance")
        }
    }
}

struct Employee {
    var name: String
    var basicSalary: Double
    
    var netSalary: Double {
        return basicSalary * 0.9
    }
}

struct Speed {
    var metersPerSecond: Double
    
    var kmPerHour: Double {
        return metersPerSecond * 3.6
    }
    
    var milesPerHour: Double {
        return metersPerSecond * 2.237
    }
}

struct CarSpeed {
    var speed: Double {
        willSet {
            print("Current speed: \(speed) km/h")
            print("Changing speed to: \(newValue) km/h")
        }
        didSet {
            if speed > 120 {
                print("WARNING: Speed exceeds 120 km/h!")
            }
        }
    }
}

struct Circle {
    static let pi = 3.14159
    var radius: Double
    
    static func area(radius: Double) -> Double {
        return pi * radius * radius
    }
}

struct Customer {
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

func demonstrateStructures() {
    let book = Book(title: "Swift Programming", author: "John Doe", price: 29.99, yearPublished: 2024)
    book.displayBook()
    
    let rectangle = Rectangle(width: 10.0, height: 5.0)
    print("Rectangle area: \(rectangle.calcArea())")
    
    let temp = Temperature(fahrenheit: 98.6)
    print("Temperature in Celsius: \(temp.celsius)")
    
    let student = Student()
    print("Default student: \(student)")
    
    let phone = Smartphone(brand: "Apple", model: "iPhone 15", storageGB: 128, price: 999.0)
    print("Phone specs: \(phone)")
    
    let account = BankAccountWithMin(accountHolder: "Jane Doe", balance: 300.0)
    print("Account balance: ₹\(account.balance)")
    
    let car1 = CarDetails(brand: "Toyota", model: "Camry")
    let car2 = CarDetails(brand: "Honda", model: "Civic", year: 2024)
    print("Cars: \(car1), \(car2)")
    
    var bankAccount = BankAccount(accountHolder: "John Smith", balance: 1000.0)
    bankAccount.deposit(amount: 500.0)
    bankAccount.withdraw(amount: 200.0)
    print("Final balance: \(bankAccount.balance)")
    
    var myCar = Car(fuelLevel: 50.0, mileage: 15.0)
    myCar.refuel(amount: 30.0)
    myCar.drive(distance: 100.0)
    print("Remaining fuel: \(myCar.fuelLevel)%")
    
    let employee = Employee(name: "Alice", basicSalary: 50000.0)
    print("Net salary: ₹\(employee.netSalary)")
    
    let speed = Speed(metersPerSecond: 10.0)
    print("Speed in km/h: \(speed.kmPerHour)")
    print("Speed in mph: \(speed.milesPerHour)")
    
    var carSpeed = CarSpeed(speed: 100.0)
    carSpeed.speed = 130.0
    let _ = carSpeed
    // print(copiedCarSpeed);
    print("Circle area: \(Circle.area(radius: 5.0))")
    
    let customer = Customer(name: "Bob", id: 1001)
    print("Customer: \(customer)")
}

demonstrateStructures()