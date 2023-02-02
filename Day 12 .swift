import Foundation


class Testing {
    var someStr: String = "Hello World"
}

var testObj1 = Testing()
testObj1.someStr = "Hello Wordld!!"

var testObj2 = testObj1
testObj2.someStr = "Bye Bye World"
print(testObj2.someStr) ; print(testObj1.someStr)



class Statue {
    var sculptor = "Unknown"
}
var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)


class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)


func isASubset(Set_A: [Int], Set_B: [Int]) -> Bool {
    for b in Set_B {
        for a in Set_A {
            if a == b {
                print("Set B is Subset of Set A")
                return true
            }
        }
    }
    print("Set B is Not Subset of Set A")
    return false
}

isASubset(Set_A: [1, 2, 3, 4, 5], Set_B: [5, 1, 4, 10])



// MARK: Classes introduce a new, important, and complex feature called inheritance – the ability to make one class build on the foundations of another.

/*
    things that classes and structs have in common include:
    1. You get to create and name them.
    2. You can add properties and methods, including property observers and access control.
    3. You can create custom initializers to configure new instances however you want.
 
    
    things that classes and structs don't have in common include:
    1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
    2. Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
    3. When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
    4. When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
    5. Even if you make a class constant, you can still change its properties as long as they are variables.
 */


class Game {
    var score: Int = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


/* MARK: Why does Swift have both classes and structs?
     - No Automatic Initlizer: Classes do not come with synthesized memberwise initializers.
     - Inheritance: One class can be built upon (“inherit from”) another class, gaining its properties and methods.
     - Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
     - deinit: Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
     Overiding: Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.
 */


class Painting {
    var title: String
    var artist: String
    var paintType: String
     
    init(title: String, artist: String, paintType: String) {
        self.title = title
        self.artist = artist
        self.paintType = paintType
    }
}

class BoardGame {
    var name: String
    var minimumPlayers = 1
    var maximumPlayers = 4
    init(name: String) {
        self.name = name
    }
}

class TIE {
    var name: String
    var speed: Int
    init(name: String, speed: Int) {
        self.name = name
        self.speed = speed
    }
}
let fighter = TIE(name: "TIE Fighter", speed: 50)
let interceptor = TIE(name: "TIE Interceptor", speed: 70)
let fighter2 = TIE.init(name: "Tie Dude", speed: 0)


class ThemePark {
    var entryPrice: Int
    var rides: [String]
    init(rides: [String]) {
        self.rides = rides
        self.entryPrice = rides.count * 2
    }
}

class Empty {}
var emptyObj = Empty()

Empty.self

class Singer {
    var name: String
    var favoriteSong: String
    init(name: String, song: String) {
        self.name = name
        self.favoriteSong = song
    }
}
let taylor = Singer(name: "Taylor Swift", song: "Blank Space")



class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
}


class Maneger : Employee {
    func work() {
        print("I am working \(hours)")
    }
}

Maneger.init(hours: 10).work()




func compareFractions(x: Int, y: Int) -> Bool{
    if 1/x - 1/y == 0 {
        return true
    }
    return false
}


let setC = [-3, -2, -1, 1, 2]
let setD = setC


/*
 func findTheSetOfOrderedPairs(set_A: [Int], set_B: [Int], RULE: ((Int, Int) -> Bool) ) -> [[Int]] {
     let ARB: [[Int]] = [[]]
     var AxB: [[Int]] = [[]]
     
     for x in set_A {
         for y in set_B {
             AxB.append([x, y])
         }
     }
     
     for element in AxB {
         if RULE.(element[0]) == true {
             ARB.append(<#T##newElement: [Int]##[Int]#>)
         }
     }
     
     
     return ARB
 }*/

var foundingDate = (["Day" : 23 ], ["Month" : 1], ["Year" : 2003 ])



class Company {
    var name: String = String()
    var foundingDate: Int = 2000

    init(name: String) {
        self.name = name
    }
}

class BITS : Company {
    var name2 = String()
    
    func createPlan() {
        
    }
}



final class FinalClass : Employee {
    let one = 1
    let zero = 0
    
}


class Vehicle {
    var isElectric: Bool
    
    init (isElectric: Bool) {
        self.isElectric = isElectric
    }
}



class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}


class ThemePark2 {
    var entryPrice: Int
    var rides: [String]
    init(rides: [String]) {
        self.rides = rides
        self.entryPrice = rides.count * 2
    }
}

class Vehicle2 {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}

class Truck: Vehicle2 {
    var goodsCapacity: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels)
    }
}


class User {
    var name: String = "Mark"
    
    func copy() -> User {
        let user = User()
        user.name = "Not Mark"
        return user
    }
}


struct UserStruct {
    var name: String = "Mark"
    
    func copy() -> UserStruct {
        var user = UserStruct()
        user.name = "Not Mark"
        return user
    }
}

class UserID {
    var id: Int = 10
    
    init(id: Int) {
        self.id = id
        print("Hello user: \(id) You Are alive!")
    }
    
    deinit {
        print("Hello user: \(id) You Are dead :(")
    }
}

var newUser = UserID(id: 5)
var users: [Int] = []

for i in 1...10 {
    let user = UserID(id: i)
    print("user id is : \(user.id)")
    users.append(user.id)
}


struct GalacticaCrew {
    var isCylon = false
}
var starbuck = GalacticaCrew()
var tyrol = starbuck
tyrol.isCylon = true
print(starbuck.isCylon)
print(tyrol.isCylon)
