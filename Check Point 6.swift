import Foundation

/* MARK: CHECHPOINT 6 - STRUCTS 2
    create a struct to store information about a car, including its model, number of seats, and current gear,
    then add a method to change gears up or down. Have a think about variables and access control: what data should be a
    variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate
    its input somehow?
 */


// My Solution
struct Car {
    public let model: String
    public let seatNumber: Int
    public var currentGear: String
    private let possibleGears: [String]
    
    init(model: String, seats: Int, gear: String) {
        self.model = model
        self.seatNumber = seats
        self.currentGear = gear
        possibleGears = ["Drive", "Park", "Netural", "Reverse"]
    }
    
    mutating func changeGears(gearNum: Int) -> Bool {
        if gearNum < 0 || gearNum > 3 {
            print("gear is not in range")
            return false
        }
        else {
            currentGear = possibleGears[gearNum]
            print("Gear set to \(currentGear)")
        }
        
        return true
    }
}

var carObj = Car(model: "Ford", seats: 2, gear: "drive")
carObj.changeGears(gearNum: 3)
carObj.changeGears(gearNum: 2)
