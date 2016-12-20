//: [Previous](@previous)

import Foundation
class BaseScreen {
    
    func exists(element: String) -> Void{
        print( "Call from exists method of BaseScreen class \(element)")
    }

}
class HomeScreen : BaseScreen {
    
    private let add_button = "add_button"
    
    private let total_expenses = "total_expenses_amount"
    
    override init(){
        super.init()
        self.exists(element: total_expenses)
        self.exists(element: add_button)
    }
    
    
    func addNewExpense(){
       print( "Call from HomeScreen class \(add_button)" )
    }
}

var homeScreen = HomeScreen()

homeScreen.addNewExpense()


class Building {
    
    static var buildingsBuiltCount = 0
    static let creator = "Alex's Architects Inc."
    
    let squareFootage = 535
    let doorCount = 1
    let windowCount = 4
    let storeyCount = 2
    
    let constructionDate: NSDate
    var needsMaintenance: Bool
    var isDoorOpen: Bool
    var idNumber : Int
    
    init() {
        self.constructionDate = NSDate()
        self.needsMaintenance = false
        self.isDoorOpen = false
        self.idNumber = Building.buildingsBuiltCount + 1
        type(of: self).buildingsBuiltCount += 1
    }
    
    func openDoor() {
        isDoorOpen = true
    }
    
    func closeDoor() {
        isDoorOpen = false
    }
    
    static func printReport() {
        print("Report for Buildings designed by \(creator)")
        print("---")
        print("Buildings made: \(buildingsBuiltCount)")
    }
}

//Building.openDoor()

let myFirstBuilding = Building() // Build the building ("create an instance")
myFirstBuilding.openDoor() // Open the door
print(myFirstBuilding.isDoorOpen) // => true

let mySecondBuilding = Building()

mySecondBuilding.openDoor()
print(mySecondBuilding.isDoorOpen) // => true
mySecondBuilding.closeDoor()
print(mySecondBuilding.isDoorOpen) // => false

print(mySecondBuilding.constructionDate) // => 2016-10-27 10:55:30 +0000
print(mySecondBuilding.needsMaintenance) // => false

let dilapidatedBuilding = Building()
dilapidatedBuilding.needsMaintenance = true
print(mySecondBuilding.needsMaintenance) // => false
print(mySecondBuilding.needsMaintenance) // => true

Building.printReport()


//: [Next](@next)
