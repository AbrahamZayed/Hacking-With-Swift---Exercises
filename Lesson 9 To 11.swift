import Cocoa


// STRUCTS - PART TWO
// MARK: structs let us combine individual pieces of data to make something new, then attach methods so we can manipulate that data.
// In This Part You Will Learn: static properties and access control – the art of stopping other parts of your code from meddling in places they ought not to be.

    // How to limit access to internal data using access control
    // MARK: By default, Swift’s structs let us access their properties and methods freely, but often that isn’t what you want – sometimes you want to hide some data from external access.


struct BankAccount {
    var name: String
    var funds: Int
    var password: String
    
    mutating func deposit(depositeAmount: Int) -> Int {
        return funds + depositeAmount
    }
    
    mutating func withdraw(withdrawnAmount: Int) -> Bool {
        if funds >= withdrawnAmount {
            funds -= withdrawnAmount
            print("You Took Out \(withdrawnAmount) Dollars.")
            return true
        }
        else {
            return false
        }
    }
}

struct BankAccount3 {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

// MARK: Use private for “don’t let anything outside the struct use this.”
// MARK: Use fileprivate for “don’t let anything outside the current file use this.”
// MARK: Use public for “let anyone, anywhere use this.”
// MARK: USE private(set) This means “let anyone read this property, but only let my methods write it.”

// MARK: Important: If you use private access control for one or more properties, chances are you’ll need to create your own initializer.


struct SecureBankStruct {
    private(set) var funds: Int = 1000
    private(set) var name: String = "Mark Cuban"
    
    mutating func deposit(depositAmount: Int?) -> (Bool, String) {
        funds += depositAmount ?? 0
        if depositAmount == nil {
            return (false, "Could not complete Deposite \n \(funds) remaining in your account")
        }
        else {
            return (true, "Deposite Complete! \n \(funds) remaining in your account")
        }
    }
    mutating func withdraw() -> Bool {
        
        
        return false
    }
    
}



struct Order {
    private var id: Int
    init(id: Int) {
        self.id = id
    }
}
let order = Order(id: 1)

struct Person {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person(ssn: "555-55-5555")

struct Contributor {
    private var name = "Anonymous"
}
let paul = Contributor()

struct SecretAgent {
    private var actualName: String
    public var codeName: String
    init(name: String, codeName: String) {
        self.actualName = name
        self.codeName = codeName
    }
}
let bond = SecretAgent(name: "James Bond", codeName: String(007))



struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])


struct RebelBase {
    private var location: String
    private var peopleCount: Int
    init(location: String, people: Int) {
        self.location = location
        self.peopleCount = people
    }
}
let base = RebelBase(location: "Yavin", people: 1000)


struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])

struct Customer {
    var name: String
    private var creditCardNumber: Int
    init(name: String, creditCard: Int) {
        self.name = name
        self.creditCardNumber = creditCard
    }
}
let lottie = Customer(name: "Lottie Knights", creditCard: 1234567890)

struct Toy {
    var customerPrice: Double
    private var actualPrice: Int
    init(price: Int) {
        actualPrice = price
        customerPrice = Double(actualPrice) * 2.0
    }
}
let buzz = Toy(price: 10)


struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")

    // MARK: IMORTANT - Private Vars inside a struct should always be Intilized, either by an init func or setting it's value.



// STATIC PROPERTIES AND METHODS

struct School2 {
    static var studentCount: Int = 0
    private(set) static var someVar: String = "ASBJSDHAVB!21!@!@#"
    
    static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
}

School2.add(student: "Mark")
var studentArr: [String] = ["John", "Mark II", "Abraham", "Lily"]
for s in studentArr {
    School2.add(student: s)
}

// I haven’t created an instance of School – we can literally use add() and studentCount directly on the struct. This is because those are both static, which means they don’t exist uniquely on instances of the struct.
// MARK:  keyword static in there, which means both the studentCount property and add() method belong to the School struct itself, rather than to individual instances of the struct.
// MARK: Important - This should also explain why we’re able to modify the studentCount property without marking the method as mutating – that’s only needed with regular struct functions for times when an instance of struct was created as a constant, and there is no instance when calling add().
// NOTE:
    // 1. static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
    // 2. To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.


struct tryingErros {
    private var password: String = ""
    static var newPets: [String] = []
    static var ownerName: String = "" {
        didSet {
            print("\(oldValue) was replaced \(ownerName)")
        }
        willSet {
            print("The new value \(newValue) was not changed")
        }
    }
    
    static func addPet(newPet: String) {
        newPets.append(newPet)
        print("\(newPet) has joined the pet gang!!")
    }
}

tryingErros.addPet(newPet: "Doggo Spinoza")
var perorin = tryingErros()
print(tryingErros.newPets)


    // NOTE : You cant use a get set or a didSet willSet property Observer on an intilized Variable
    // Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

    // Tip: It’s easy to forget the difference between self and Self, but if you think about it it’s just like the rest of Swift’s naming – we start all our data types with a capital letter (Int, Double, Bool, etc), so it makes sense for Self to start with a capital letter too.


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee7 {
    let userName: String
    let password: String
    
    static let example = Employee7(userName: "Mark", password: "basdjbqyugeb1u2")
}

Employee7.example


struct MyStruct {
    var count = 0

    mutating func add(amount: Int) {
        count += amount
    }
}

var myStruct = MyStruct()

for i in [1, 2, 3, 4] { myStruct.add(amount: i) }


struct employe_A1 {
    static var entropy = Int.random(in: 1...1000)

    static func getEntropy() -> Int {
        entropy += 1
        return entropy
    }
    
     func returnLargeDateSet() {
        var numArrEntr: [Int] = []
        for _ in 1...100 {
            employe_A1.entropy += 1
            numArrEntr.append(employe_A1.entropy)
        }
        var sumOfEntrArr = 0
        for i in numArrEntr {
            sumOfEntrArr += i
        }
        print(sumOfEntrArr / numArrEntr.count)
        
    }
}
employe_A1.returnLargeDateSet(employe_A1())

employe_A1.entropy

struct Question {
    static var answer = 42
    var questionText = "Unknown"
    
    init(questionText: String, answer: Int) {
        self.questionText = questionText
        Question.self.answer = answer
    }
}
struct Question2 {
    static var answer = 42
    var questionText = "Unknown"
    
    init(questionText: String) {
        self.questionText = questionText
    }
}

// this is valid swift! - Which came to a suprise
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking { // You can change the static var inside the closure
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
    
    mutating func changeStaticVars() {
        if headline.hasPrefix("Breaking") {
            NewsStory.breakingNewsCount += 1
            print("That's a boring start")
        }
        else {
            print("Good Job! You're not a total bore")
        }
    }
}

struct Cat {
    static var allCats = [Cat]()
    
    init() {
        Cat.allCats.append(self)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}

var catObj = Cat()
Cat.chorus()

struct Cat2 {
    static var allCats = [Cat2]()
    
    init(newCat: Cat2) {
        Cat2.allCats.append(newCat)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}

// NOTE: Referencing a static property inside a regular method isn't allowed;

struct Person1 {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        Person1.population += 1
    }
}

struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}


// When would you use self in a method?
    // MARK: Inside a method, Swift lets us refer to the current instance of a struct using self, but broadly speaking you don’t want to unless you specifically need to distinguish what you mean.
    // MARK: By far the most common reason for using self is inside an initializer, where you’re likely to want parameter names that match the property names of your type,
    // MARK: Outside of initializers, the main reason for using self is because we’re in a closure and Swift requires it so we’re clear we understand what’s happening. This is only needed when accessing self from inside a closure that belongs to a class, and Swift will refuse to build your code unless you add it.
    // MARK: Initializers must go over all value except if there is a default value

struct Student_Struct {
    var name: String
    var bestfrind: String
    
    init(studentName: String, bestfriendName: String) {
        name = studentName
        bestfrind = bestfriendName
    }
}

struct Dictionary {
    var words = Set<String>()
}
let dictionary = Dictionary()

struct CountryStruct {
    var name: String
    var usesImperial: Bool
    init(countryName: String) {
        name = countryName
        
        if countryName == "Liberia" || countryName == "Myanmar" || countryName == "USA" {
            self.usesImperial = true
        }
        else {
            self.usesImperial = false
        }
    }
}

struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}

struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}
let message = Message() // You don't have to intilize the message variable itself, it can be left for later


struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

struct Language {
    var nameEnglish: String
    var nameLocal: String
    var speakerCount: Int
    init(english: String, local: String, speakerCount: Int) {
        self.nameEnglish = english
        self.nameLocal = local
        self.speakerCount = speakerCount
    }
}
let french = Language(english: "French", local: "français", speakerCount: 220_000_000)

struct Character {
    var name: String
    var actor: String
    var probablyGoingToDie: Bool
    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
        if self.actor == "Sean Bean" {
            probablyGoingToDie = true
        } else {
            probablyGoingToDie = false
        }
    }
}


struct SuperHero {
    var nickname: String
    var powers: [String]
    init(nickname: String, superPowers: [String]) {
        self.nickname = nickname
        self.powers = superPowers
    }
}
let batman = SuperHero(nickname: "The Caped Crusader", superPowers: ["He's really rich"])



struct Tree {
    var type: String
    var hasFruit: Bool
    init() {
        type = "Cherry"
        hasFruit = true
    }
}
let cherryTree = Tree()


// How do Swift’s memberwise initializers work?
    // MARK: When you craete a custom intilizer, the default one can no longer be used
    // MARK: You Can declare multiple intilizer in code, but their parameters should be different
    // MARK: use "extention" to declare an intilizer outside your structure while retining the default init() func



struct userStruct {
    var name: String
    var yearAdded: Int {
        didSet {
            if yearAdded < 2012 {
                print("what are you a magician?")
            }
        }
    }
    

}

extension userStruct {
    init(name: String) {
        self.name = name
        yearAdded = 2012
    }
}


struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()





// How to create custom initializers

    // MARK: all properties must have a value by the time the initializer ends.

struct Player_Struct_One {
    var name: String
    var team: String
}

Player_Struct_One(name: "Messi", team: "idfk")

struct Player_Struct_two {
    var name: String
    var team: String
    var age: Int? {
        didSet {
            if age == nil {
                age = 18
            }
        }
    }
    
    init(name: String, team: String, age: Int?) {
        self.name = name
        self.team = team
        self.age = age ?? Int.random(in: 1...100)
    }
}

var playerMessiStruct = Player_Struct_two.init(name: "Messi", team: "Argentine", age: nil) ; print(playerMessiStruct)

/* Why Would you create the intilizer yourself when swift automatically does it?
    - Becuase now the initializer is owned by us so we can add extra functionality there if needed.
*/

// MARK:  Although you can call other methods of your struct inside your initializer, you can’t do so before assigning values to all your properties – Swift needs to be sure everything is safe before doing anything else.

// MARK: You can add multiple initializers to your structs if you want, as well as leveraging features such as external parameter names and default values. However, as soon as you implement your own custom initializers you’ll lose access to Swift’s generated memberwise initializer unless you take extra steps to retain it. This isn’t an accident: if you have a custom initializer, Swift effectively assumes that’s because you have some special way to initialize your properties, which means the default one should no longer be available.



struct PlayerStruct {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...20)
    }
    
    init(name: String, number: Int) { // MARK: You can use more than one init "function"
        self.name = name
        self.number = number
    }
}

let newPlayerObj = PlayerStruct.init(name: "Messi")
newPlayerObj.number ; print(newPlayerObj.number)

/*
    NOTE:
    - didSet and willSet are what is know as "property observers"
    - get: used to computed the value of a "Computed value"
    - set: sets a variable to a new value
    - willSet:runs some code before the property changes, which in turn provides the new value that will be assigned in case you want to take different action based on that.
    - didSet:
    - oldValue: Exists within "didSet" provides the old value of the computed value.
    - newValue:
 
 */

struct App2 {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App2()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

/* Why use willSet and didSet?
    - The most important reason is convenience: using a property observer means your functionality will be executed whenever the property changes. Sure, you could use a function to do that, but would you remember? Always? In every place you change the property?
    - There is one place where using a property observer is a bad idea, and that’s if you put slow work in there.
 */

/* When Should you use willSet rather than didSet
    - The simple answer is this: most of the time you will be using didSet, because we want to take action after the change has happened so we can update our user interface, save changes, or whatever. That doesn’t mean willSet isn’t useful, it’s just that in practice it is significantly less popular than its counterpart.
    - The most common time willSet is used is when you need to know the state of your program before a change is made.
 */

struct BankAccount2 {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}

struct Child {
    var name: String
    var age: Int {
        didSet {
            if age < oldValue {
                print("Your age decreassed....How? ")
            }
            print("Happy birthday, \(name)!")
        }
    }
}

var childObj = Child.init(name: "Mark", age: 18)

childObj.age = 19
childObj.age = 20
childObj.age = 10


struct Dog { var age: Int { didSet { let dogAge = age * 7 ;print("I'm now \(dogAge) in dog years.") } }}

struct Person2 {
    
    var clothes: String {
        didSet {
            print("I'm changing to \(clothes)")
        }
    }
}

// NOTE:  You can't attach a property observer to a constant, because it will never change.
// NOTE:  didSet and willSet must exist within a variable
// NOTE:  You can't store stored properties into an enum

struct Football_Player {
    var name: String
    var value: Int
    var age: Int {
        didSet {
            print("happy birthday \(name)!")
            print(oldValue) // oldValue only exists in didSet
            if age > 30 {
                print("You seem too old to be playing football")
            }
        }
        willSet {
            print(newValue) // newValue only exists in willSet
        }
    }
    var currentTeam: String
    var alive: Bool
    var oldTeams: [String]
    
    
}


struct Game_Struct_2 {
    var score: Int = 0 {
        didSet { // This runs certin code every time the value of "Score" Changes
            print(score)
        }
    }
}

var game2 = Game_Struct_2()
game2.score = 2
game2.score += 10
game2.score *= 2



struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1






struct EmployeeStruct2 {
    var name: String
    var vecationDaysAllocated: Int = 10
    var vecationDaysTaken: Int = 0
    
    var vecationDaysRemaining: Int {
        get {
            vecationDaysAllocated - vecationDaysTaken
        }
        set {
            vecationDaysAllocated = vecationDaysTaken + newValue
        }
    }
}


// Structs

struct User {
    var name: String
    var nameArch: [String]
    var age: Int
    var password: String
    var favouriteMovie: String?
    
    func returnUserInfo() -> String{
        return "\(name), One Names: \(nameArch), \(age), favurite movie: \(favouriteMovie ?? "no favourite movie selected")the password is confidential!!"
    }
}

let userOne = User(name: "Abraham Zayed", nameArch: ["Spongbob", "Bily Butcher"], age: 19, password: "ASBHJ12312", favouriteMovie: nil)

userOne.returnUserInfo()


struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

var boolValue: Bool? = true

boolValue = nil

if boolValue  == nil {
    boolValue = false
}


struct Employe {
    var name: String
    var vacationDaysRemaining: Int
    var counter = 0
    
    mutating func checkForVecactionDays(days: Int) -> String {
        if vacationDaysRemaining > days {
            vacationDaysRemaining -= 1
            return "There are still \(vacationDaysRemaining) days remaining"
        }
        else {
            if counter == 10 {
                vacationDaysRemaining += 1
                counter = 0
            }
            counter += 1
            return "Your vacation days are over"
        }
        
    }
}


// You see, if we create an employee as a constant using let, Swift makes the employee and all its data constant – we can call functions just fine, but those functions shouldn’t be allowed to change the struct’s data because we made it constant.

struct Employee2 {
    let name: String
    var vacationRemaining: Int = 10

    
    // When changing the date within a structue, use the "mutating" keyword before the function declaration
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        }
        else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}


var abod = Employee2(name: "Abod", vacationRemaining: 10)
abod.takeVacation(days: 12)
abod.takeVacation(days: 9)


/* NOTE
 Variables and constants that belong to structs are called properties.
 Functions that belong to structs are called methods.
 When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
 When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
 */


let archer1 = Employee2(name: "Arther", vacationRemaining: 19)
let archer2 = Employee2.init(name: "Arther The Second", vacationRemaining: 100)

let someClosures: (Employee2) -> String = { Emp in
    return Emp.name
}

let a = 1
let b = 2.0
let c = Double(a) + b // This does the exact same thing as the above line of code


var employee5 = Employee2.init(name: "Susana")

    // What's the difference between a structure and a tuple
    /*
        a tuple is effectively just a struct without a name, like an anonymous struct.
        and thus structures are much more useful when the code will be reused multiple time.
        NOTE:  use tuples when you want to return two or more arbitrary pieces of values from a function, but prefer structs when you have some fixed data you want to send or receive multiple times.
    */

struct User_Struct {
    var name: String
    var age: Int
    var city: String
}

let User_Tuple: (name: String, age: Int, city: String) // User_struct and User_Tuple are essentially the same thing



    // What’s the difference between a function and a method?
    // Honestly, the only real difference is that methods belong to a type, such as structs, enums, and classes, whereas functions do not
    // Advantages to Methods Over Functions
    // 1.  being associated with a specific type such as a struct means that methods gain one important super power: they can refer to the other properties and methods inside that type
    // 2. Methods avoid namespace pollution, in other words you don't have to reserve as much function names

enum someEnum {
    case firstCase
    case secondCase
    
    func someEnumImbededFunc() -> someEnum.Type {
        return someEnum.self
    }
}


/* How to compute property values dynamically
 a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed. This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties, but work like functions.
 */


struct EmployeeStruct {
    var name: String
    var vecationDaysAllocated: Int = 10
    var vecationDaysTaken: Int = 0
    
    var vecationDaysRemaining: Int {
        vecationDaysAllocated - vecationDaysTaken
    }
}

var newEmployee = EmployeeStruct(name: "Mark")


/*  When should you use a computed property or a stored property?
    - A computed property is effectively just a function call that happens to belong to your struct.
    - Use a stored property when you regularly read a property whose value has not changed
    - Use a computed property if your property is read very rarely and perhaps not at all
    - When it comes to dependencies – whether your property’s value relies on the values of your other properties – then the tables are turned: this is a place where computed properties are useful, because you can be sure the value they return always takes into account the latest program state.
 
    NOTE:
    1. Computed properties must always have an explicit type.
    2. Constants cannot be computed properties.
 */


struct Keyboard {
    var isMechanical = false
    var noiseLevel: Int {
        if isMechanical {
            return 11
        } else {
            return 3
        }
    }
}

let majestouch = Keyboard(isMechanical: true)
print(majestouch.noiseLevel)


struct TypesOfStructVars {
    private var password: String
    public var userName: String
    fileprivate var someVar: Int
    
    mutating func changeUserName(newName: String) {
        userName = newName
    }
}


/* MARK: SUMMARY
     You can create your own structs by writing struct, giving it a name, then placing the struct’s code inside braces.
     
     Structs can have variable and constants (known as properties) and functions (known as methods)
     
     If a method tries to modify properties of its struct, you must mark it as mutating.
     
     You can store properties in memory, or create computed properties that calculate a value every time they are accessed.
     
     We can attach didSet and willSet property observers to properties inside a struct, which is helpful when we need to be sure that some code is always executed when the property changes.
     
     Initializers are a bit like specialized functions, and Swift generates one for all structs using their property names.
     
     You can create your own custom initializers if you want, but you must always make sure all properties in your struct have a value by the time the initializer finishes, and before you call any other methods.
     
     We can use access to mark any properties and methods as being available or unavailable externally, as needed.
     
     It’s possible to attach a property or methods directly to a struct, so you can use them without creating an instance of the struct.
     
 */
