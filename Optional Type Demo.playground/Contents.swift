import UIKit

var greeting = "Hello, playground"

var explictText: String = "Hello"
var implicitText = "Hello"

var name: String? = "Strong"
print(name ?? "No Value")

var totalScore: Int? = 100
if totalScore != nil {
    totalScore! += 100
    print(totalScore!)
}
if var totalScore = totalScore ,let name = name{
    totalScore += 100
    print("Name: " + name)
    print("Score: \(totalScore)")
}

if let _ = name {
    print("The name is not nil")
} else {
    print("The name is nil")
}
