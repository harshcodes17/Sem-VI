import Foundation

// 1. Declare an optional Int variable named score and assign it a value of nil. Then assign it a value of 90.
var score: Int? = nil
score = 90
print("Score: \(score!)")  // Force unwrapping to print

// 2. What will happen if you force unwrap an optional that is nil? Try it in a Swift playground.
var testNil: Int? = nil
// print(testNil!) // This will crash at runtime with a fatal error: Unexpectedly found nil while unwrapping an Optional value.

// 3. Write a function that takes an optional String and prints its value if it is not nil. Otherwise, print "No value".
func printOptionalString(_ str: String?) {
    if let value = str {
        print("Value: \(value)")
    } else {
        print("No value")
    }
}

// 4. Write a function that takes an optional Double and returns half of its value. If nil, return 0.0.
func halfValue(of number: Double?) -> Double {
    return number != nil ? number! / 2 : 0.0
}

// 5. Use optional binding (if let) to safely unwrap an optional integer and print its value.
var optionalInt: Int? = 25
if let value = optionalInt {
    print("Unwrapped value: \(value)")
} else {
    print("Value is nil")
}

// 6. Define a class Book with an optional property author: String?. Create an instance of Book and use optional chaining to print the author's name if available.
class Book {
    var author: String?
}
let myBook = Book()
myBook.author = "George Orwell"
print("Author: \(myBook.author ?? "Unknown")") // or use optional chaining
print("Author (optional chaining): \(myBook.author?.uppercased() ?? "Unknown")")

// 7. Write a function that takes an optional dictionary [String: Int]? and returns the value of a given key. If the dictionary is nil or the key does not exist, return -1.
func valueForKey(_ dict: [String: Int]?, key: String) -> Int {
    if let dict = dict, let value = dict[key] {
        return value
    }
    return -1
}

// 8. Implement a function that takes an optional sentence (String?) and returns the first word if available. Otherwise, return "No words".
func firstWord(of sentence: String?) -> String {
    if let sentence = sentence {
        let words = sentence.split(separator: " ")
        return words.isEmpty ? "No words" : String(words[0])
    }
    return "No words"
}

// 9. Create a struct User with an optional property email: String?. Write a method inside the struct to return a valid email or "No email provided".
struct User {
    var email: String?
    
    func getEmail() -> String {
        return email ?? "No email provided"
    }
}

// 10. Implement a BankAccount class with a property balance: Double. The initializer should return nil if the initial balance is negative.
class BankAccount {
    var balance: Double
    
    init?(initialBalance: Double) {
        if initialBalance < 0 {
            return nil
        }
        self.balance = initialBalance
    }
}

// 11. Implement a User struct that only allows usernames with at least 5 characters. If a shorter username is given, return nil.
struct ValidUser {
    var username: String
    
    init?(username: String) {
        if username.count < 5 {
            return nil
        }
        self.username = username
    }
}
