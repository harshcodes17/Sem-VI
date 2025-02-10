
let name = "Harsh"
let age = 21
print("\(name) is \(age) years old.")

let num1 = 10
let num2 = 5
print("The sum of \(num1) and \(num2) is \(num1 + num2)")

// 3. String length
let sampleString = "Hello, Swift!"
print("Length of string: \(sampleString.count)")


let mixedCase = "Swift Programming"
print("Uppercase: \(mixedCase.uppercased())")
print("Lowercase: \(mixedCase.lowercased())")


let testString = "Not Empty"
let emptyString = ""
func checkIfEmpty(_ str: String) {
    print(str.isEmpty ? "String is empty" : "String is not empty")
}
checkIfEmpty(testString)
checkIfEmpty(emptyString)


let firstPart = "Hello"
let secondPart = "World"
let concatenated = firstPart + " " + secondPart
print(concatenated)


let word = "SwiftLanguage"
print(word.hasPrefix("Swift"))


let website = "www.example.com"
if let domainExt = website.split(separator: ".").last {
    print(".\(domainExt)")
}

let text = "The quick brown fox"
print(text.contains("brown"))


let str1 = "Hello"
let str2 = "hello"
print("Case-sensitive comparison: \(str1 == str2)")


print("Case-insensitive comparison: \(str1.lowercased() == str2.lowercased())")


func isWeekend() -> Bool {
    let today = "Saturday"
    return today == "Saturday" || today == "Sunday"
}
print("Is it weekend? \(isWeekend())")


func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
print("Is 10 even? \(isEven(number: 10))")


func celsiusToFahrenheit(celsius: Double) -> Double {
    return celsius * 9/5 + 32
}
print("25°C in Fahrenheit: \(celsiusToFahrenheit(celsius: 25))°F")


func power(base: Int, exponent: Int = 2) -> Int {
    var result:Int = 1;
    
    for _ in 1...exponent {
        result = result*base
    }
    return result
}
print("2 squared: \(power(base: 2))")
print("2 cubed: \(power(base: 2, exponent: 3))")


func calculateArea(of length: Double, and width: Double) -> Double {
    return length * width
}
print("Area of rectangle: \(calculateArea(of: 10, and: 5))")


func greet(person name: String) {
    print("Hello, \(name)!")
}
greet(person: "Harsh")


func repeatMessage(_ message: String, _ times: Int) {
    for _ in 1...times {
        print(message)
    }
}
repeatMessage("Go Home!", 3)


func maxOfTwo(a: Int, b: Int) -> Int {
    return max(a, b)
}
print("Maximum of 8 and 12: \(maxOfTwo(a: 8, b: 12))")


func factorial(n: Int) -> Int {
    if n <= 1 { return 1 }
    return n * factorial(n: n - 1)
}
print("Factorial of 5: \(factorial(n: 5))")

