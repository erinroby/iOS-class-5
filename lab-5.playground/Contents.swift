import UIKit

// Given an array of million words, write a function to return all palindromes.

func returnPalindromes(array: [String]) -> [String] {
    var palindromes = [String]()
    
    for word in array {
        let reverse = String(word.characters.reverse())
        if (word == reverse) {
            palindromes.append(word)
        }
    }
    
    return palindromes
}

let array = ["eye", "cat", "dog", "racecar"]

returnPalindromes(array)

// Implement base 16 conversion function

func decToHex(number: Int) -> String {
    var string = String(format:"%2X", number)
    string += " is \(number) in hex"
    return string
}

decToHex(65678)

// 2nd solution to base 16 conversion function without Foundation/IUKit

let letters = [10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]

// Could the code below to set to a computed variable instead?

func hexRemainders(number: Int) -> [Int] {
    var number = number
    var remainders = [Int]()
    
    while number >= 16 {
        remainders.insert((number % 16), atIndex: 0)
        number = Int(number / 16)
    }
    
    remainders.insert(number, atIndex: 0)
    return remainders
}

func decimalToHex(number: Int) -> String {
    let remainders = hexRemainders(number)
    var string = [String]()
    
    for int in remainders {
        if int > 9 {
            let letter = letters[int]
            string.append(letter!)
        } else {
            string.append(String(int))
        }
    }
    
    let hex = string.reduce("",combine:{$0+$1})
    return "\(hex) is the hex equilvalent of \(number)"
}

decimalToHex(160)

// write a function to convert roman numerals to base 10 numbers
let romanNums = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

func romanToDecimal(roman: String) -> String {
    var roman = roman
    var result = 0
    
    for (value, num) in romanNums {
        
        while roman.hasPrefix(num) {
            let first = roman.startIndex
            let count = num.characters.count
            roman.removeRange(first ..< first.advancedBy(count))
            
            result += value
        }
    }

    return "\(result)"
}

romanToDecimal("XXIV")
