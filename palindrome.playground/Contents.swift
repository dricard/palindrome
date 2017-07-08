// This is an example of a way to test if a string is a palindrome
//: Palindrome: a word, phrase, number, or other sequence of symbols or elements, whose meaning may be interpreted the same way in either forward or reverse direction. Famous examples include “Amore, Roma“, “A man, a plan, a canal: Panama”

import UIKit

// MARK: - Strings to test

let testStrings = [ "a", "abba", "abcba", "123454321", "qweewq", "qscefb", "A Santa at Nasa", "Never odd or even", "Not even close", "Amore, Roma",  "A man, a plan, a canal: Panama", "Go Hang a Salami! I’m a Lasagna Hog!" ]

// MARK: - Palindrome test as an extension to String

extension String {
    
    // MARK: - Utility
    private func formatString(_ wordToTest: String) -> String {
        // create a mutable local variable
        var word = wordToTest
        
        // Put everything in lowercase
        word = word.lowercased()
        
        // remove non alpha-numeric characters (punctuation, etc.)
        word = word.filter { "0123456789abcdefghijklmnopqrstuvwxyz".contains( $0 )}
        
        // return formatted string
        return word
    }
    
    func isPalindrome() -> Bool {
        
        // To make it more general
        let word = formatString(self)
        
        // trivial case
        if word.count <= 1 { return false }
        
        // this is what checks if it's a palindrome or not
        for i in 0...word.count / 2 {
            let lhs = word[word.index(word.startIndex, offsetBy: i)]
            let rhs = word[word.index(word.startIndex, offsetBy: word.count - 1 - i)]
            if lhs != rhs { return false }
        }
        
        // if we're here then it's a palindrome
        return true
    }
}

// MARK: - Test and display of results

for word in testStrings {
    print("\"\(word)\" is \(word.isPalindrome() ? "" : "not ")a palindrome")
}

