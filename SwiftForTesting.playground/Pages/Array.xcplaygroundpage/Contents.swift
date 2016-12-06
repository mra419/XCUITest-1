//: [Previous](@previous)

import Foundation

var threeStooges = ["Moe", "Larry", "Curly"]

var inningScores: [Int]

var arrayOfAny: [Any] = [1, 2.0, "three"] // Avoid doing this!

threeStooges.count

threeStooges.contains("Moe")


let larry = threeStooges[1]

threeStooges[1] = "Jerome (\"Curly\")"

let moe = threeStooges.first

let curly = threeStooges.last!

let threeStoogesSorted = threeStooges.sorted()

threeStooges.sort()

threeStooges.append("Shemp")

threeStooges.append(contentsOf: ["Joe", "Curly Joe"])

threeStooges.insert("Abbott", at: 0)

let notAStooge = threeStooges.removeFirst()

let curlyJoe = threeStooges.removeLast()

let shemp = threeStooges.remove(at: 3)

threeStooges.removeLast()

//: [Next](@next)
