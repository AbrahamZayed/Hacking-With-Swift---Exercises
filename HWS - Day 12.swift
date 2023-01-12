import Foundation

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
