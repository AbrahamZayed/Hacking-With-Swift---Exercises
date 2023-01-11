import Cocoa
import Foundation


/* Welcome to
  __,
 (           o  /) _/_
  `.  , , , ,  //  /
(___)(_(_/_(_ //_ (__
             /)
            (/
*/


// Structures

struct Album {
    let name: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(name), by \(artist), released in \(year)")
    }
    
}

let redAlbum = Album(name: "Red", artist: "Taylor Swift", year: 2012)
print(redAlbum)
print(redAlbum.artist)
print(redAlbum.name)
redAlbum.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}





func runAction(_ count: Int, action: () -> Void) {
    for _ in 1...count {
        action()
    }
}

runAction(10)  {
    print("Hello World")
}

func printItem<Item>(_ T: Item, n: Int) -> Item {
    var itemArr: [Item] = []
    for _ in 1...n {
        itemArr.append(T)
    }
    for ite in itemArr {
        print(ite)
    }
    return T
}


var someClosure: (String) -> Bool = { (honrific: String) in
    if honrific.hasPrefix("Dr") {
        print("Hello Doctor ")
        return true
    }
    else if honrific.hasPrefix("Mr") {
        print("Hello Mr ")
    }
    else {
        print("Hello Kind Sir")
        return true
    }
    print("Are you an aliean sir?")
    return false
}

func returnTheGreeting(_ name: String, using generator: @escaping ((String) -> Bool) ) -> ((String) -> Bool){
    print("Hello ") ; return generator
}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

func makeCake(instructions: () -> Void) {
    print("Wash hands")
    print("Collect ingredients")
    instructions()
    print("Here's your cake!")
}
makeCake {
    print("Mix egg and flour")
}



let swanDive: () -> Void = {
    print("Dive Down")
}

func preformDive(using dive: () -> Void) {
    print("Preforming...")
    
    dive()
}

var payCash = {
    print("Here's the money.")
}
func buyClothes(item: String, using payment: () -> Void) {
    print("I'll take this \(item).")
    payment()
}
buyClothes(item: "jacket", using: payCash)


let resignation = { (name: String) in
    print("Dear \(name), I'm outta here!")
}
func printDocument(contents: () -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    contents()
}
printDocument { resignation("Suzan") }

/*  Checkpoint 5
 Your job is to:

 Filter out any numbers that are even
 Sort the array in ascending order
 Map them to strings in the format “7 is a lucky number”
 Print the resulting array, one item per line
 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var LuckyNumbersFilteredResult: (([Int]) -> [Int]) = { (numArr: [Int]) -> [Int] in
    numArr.filter { !$0.isMultiple(of: 2) }
    numArr.sorted()
    numArr.map {print("\($0) is a lucky number")}
    
    return numArr
    
}


LuckyNumbersFilteredResult(luckyNumbers)




let awesomeTalk = {
    print("Here's a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)


var shareWinnings = { (amount: Double) in
    let half = amount / 2.0
    print("It's \(half) for me and \(half) for you.")
}


var shareWinnings2: (Double) -> Void = { (amount: Double) in
    let half = amount / 2.0
    print("It's \(half) for me and \(half) for you.")
}


let alwaysTrue: Bool = true


func luckyNumFunc(_ numArr: [Int]) -> Bool {
    var numSorted = numArr.sorted()
    var counter: Int = 0
    
    for num in numArr {
        if num % 2 == 0 {
            numSorted.remove(at: counter)
        }
        counter += 1
    }
    for num in numSorted {
        print("\(num) is a lucky number")
    }
    
    return true
}

var filteredLuckyNums = luckyNumbers.filter { $0.isMultiple(of: 2)} ; print(filteredLuckyNums)

let solve = {
    luckyNumbers.filter { !$0.isMultiple(of: 2)}
    luckyNumbers.sorted()
    luckyNumbers.map { print("\($0) is a lucky number")}
}


// How to accept functions as parameters

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    first() ; print()
    second() ; print()
    third ; print()
}


// Having three trailing closures is not as uncommon as you might expect. For example, making a section of content in SwiftUI is done with three trailing closures: one for the content itself, one for a head to be put above, and one for a footer to be put below.

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls2 = makeArray(size: 20) {
    return Int.random(in: 1...20)
}

print(rolls2)

func generateNum() -> Int{
    return Int.random(in: 1...100)
}

makeArray(size: 20, using: generateNum)

func checkForCondition(_ numArr: [Int], _ condition: (Int) -> Bool) -> Bool {
    for num in numArr {
        if condition(num) {
            return true
        }
    }
    
    return false
}
func not3(_ N: Int) -> Bool {
    if N == 3 {
        return true
    }
    return false
}
checkForCondition([1,2,3,4,5], not3)



// Closures

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let teamTOnly = team.filter { $0.hasPrefix("T")} ; print(teamTOnly)
let teamUpper = team.map { $0.uppercased()} ; print(teamUpper)




func userAge(name: String, age: Int) -> (String, Int) { return (name, age) } // Function Declaration Syntax
let userAgeClosure = { (name: String, age: Int) -> (String, Int) in return (name, age) } // Closure Declaration Syntax

userAge(name: "Abraham", age: 19)
let userAgeFuncCopy = userAge

let newAge2: (() -> Bool) = { () -> Bool in return true }
let newAge3: (() -> Bool) = { () -> Bool in print("Hello World") ; return true }


// trailing closure syntax

let captainTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 > name2
}

let captainTeamSorted = team.sorted {
    if $0 == "Suzanne"{
        return true
    }
    else if $1 == "Suzanne" {
        return false
    }
    return $0 > $1
}

print(captainTeamSorted)

let reverseTeam = team.sorted { return $0 > $1 }

func greatUser() {
    print("Hello User")
}

greatUser()

var greatUserCopy = greatUser
print(greatUserCopy) // You can't copy a function


let sayHello = {
    print("Say Hello")
}
let returnHello = {
    return "Hello"
}

let returnFuncHello = {
    return returnHello
}

let sayHelloClosure = { (_ name: String) -> String in
    return "Hello \(name)"
}

print(sayHelloClosure("Mark"))

// In the meantime, you might have a more fundamental question: “why would I ever need these things?” I know, closures do seem awfully obscure.

var greatCopy2: () -> Void = { // () -> ()
    print("hello!")
}

// Closures have no paramater names, they have paramaters, but the names are always ommited


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let date: (Int) -> String = getUserData
let user5 = date(1989)
print(user5)


let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    }
    else if name2 == "Suzanne" {
        return false
    }
    
    return name1 > name2
}


let captainFirstName = (team.sorted(by: captainFirstSorted))


/* But first I want to break down what’s happening there:

We’re calling the sorted() function as before.
Rather than passing in a function, we’re passing a closure – everything from the opening brace after by: down to the closing brace on the last line is part of the closure.
Directly inside the closure we list the two parameters sorted() will pass us, which are two strings. We also say that our closure will return a Boolean, then mark the start of the closure’s code by using in.
Everything else is just normal function code.*/

let captainFirstNameClosureDeclaration = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    }
    else if name2 == "Suzanne" {
        return false
    }
    
    return name1 > name2
})




/* Checkpoint 4
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error.
 
 
 */




enum ErrorsOfSqureFunc: Error {
    case Out_Of_Bounds
    case No_Root
}


func returnSqureOfNum(_ N: Double) throws -> ErrorsOfSqureFunc {
    if N > 10_000 {
        throw ErrorsOfSqureFunc.Out_Of_Bounds
    }
    else if N < 10_000 && N > 0 {
        print(sqrt(N))
    }
    throw ErrorsOfSqureFunc.No_Root
}





func returnSquareOfNum(_ Num: Int) -> Int {
    
    if Num > 10_000 {
        return 0
    } else if (Num < 10_000 && Num > 0) {
        for i in 1...100 {
            if (Num * Num) == (i * i) {
                return i
            }
        }
    } else {
        return 0
    }
    return 0
}



/*
 Error Handling in swift
 so Swift makes us handle errors – or at least acknowledge when they might happen.

 This takes three steps:

 Telling Swift about the possible errors that can happen.
 Writing a function that can flag up errors if they happen.
 Calling that function, and handling any errors that might happen.
 
 Note:
    Step two is to write a function that will trigger one of those errors. When an error is triggered – or thrown in Swift – we’re saying something fatal went wrong with the function, and instead of continuing as normal it immediately terminates without sending back any value.
 */


enum passwordErrors: Error {
    case short
    case obvious
}

var obviousPasswords: [String] = ["12345", "12345678910", "54321"]

func checkForPasswordStrength(userPassword P: String) -> Bool {
    let obviousPasswords: [String] = ["12345", "12345678910", "54321"]
    
    if P.count < 6 {
        print("password is too short")
        return false
    }
    
    
    for password in obviousPasswords {
        if password == P {
            print("password is too obvious")
            return false
        }
        continue
    }
    
    print("password is decent")
    return true
}

func checkPassword(password P: String) throws -> String {
    if P.count < 6 {
        throw passwordErrors.short
    }
    
    if P == "12345" {
        throw passwordErrors.obvious
    }
    
    if P.count > 6 {
        return "Ok"
    } else if P.count > 8 {
        return "Good"
    } else  {
        return "Great!"
    }
}

    /* do {
        try someRiskyWork()
    } catch {
        print("Handle errors here")
    }
 
 
    There are a few different parts of that code that deserve discussion, but I want to focus on the most important one: try. This must be written before calling all functions that might throw errors, and is a visual signal to developers that regular code execution will be interrupted if an error happens.

    When you use try, you need to be inside a do block, and make sure you have one or more catch blocks able to handle any errors. In some circumstances you can use an alternative written as try! which does not require do and catch, but will crash your code if an error is thrown – you should use this rarely, and only if you’re absolutely sure an error cannot be thrown.
    */

let somePass = "12345"

do {
    let result = try checkPassword(password: somePass)
    print("password rating is \(result)")
} catch {
    print("There was an error")
}

enum passwordError2: Error {
    case short
    case long
    case simple
    case illegalChars
}

let string = "12345"

enum PasswordError {
    case short
    case obvious
}


do {
    let result = try checkPassword(password: string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

/*
 Tip: Most errors thrown by Apple provide a meaningful message that you can present to your user if needed. Swift makes this available using an error value that’s automatically provided inside your catch block, and it’s common to read error.localizedDescription to see exactly what happened.
 */



/*
func checkForPassword2(password pass: String) throws -> String {
    let obviousPasswords: [String] = ["12345", "12345678910", "54321", "abcdefghijklmnop", "abcd12345"]
    
    for P_N in obviousPasswords {
        if P_N == pass {
            // throw passwordErrors2.simple
        }
    }
    
    return ""
}
*/



// How to customize parameter labels

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


var charactersX = ["Lana", "Pam", "Ray", "Sterling"]
charactersX.append("Mark Larson")
charactersX.removeAll(keepingCapacity: true) ; print(charactersX.capacity)
charactersX.removeAll() ; print(charactersX.capacity) // thus removeall() automatically erases all the date and the capacity


/*
func printTimeTable(for N: Int? = 1, end: Int? = 12) {
    var N_n: Int? = N ?? 10
    var end_e: Int? = end ?? 10
    
    if N_n == nil {
        print("N is non existent")
        N_n = 1
    }
    if end_e == nil {
        print("end is non existent")
        end_e = 12
    }
    
    for i in 1...end_e {
        print("\(N) x \(i) = \(N*i)")
    }
}
printTimeTable(for: nil, end: nil)
printTimeTable(for: 10, end: 10)
*/



func rollDice2(_ sides: Int, _ count: Int) -> [Int] {
    var result: [Int] = []
    
    for _ in 1...count {
        result.append(Int.random(in: 1...sides))
    }
    
    return result
}

rollDice2(20, 5)
// NOTE - This method of naming parameters for external use is so important to Swift that it actually uses the names when it comes to figuring out which method to call. This is quite unlike many other languages, but this is perfect valid in Swift:


// Are all diffrent functions to the compiler becuase they have different paramaters, and the compiler knows when you use a certain function with it's assoicated paramater
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }



let lyric2 = "I see a red door and I want it painted black"
print(lyric2.hasPrefix("I see"))

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)



/* Tuples
  Like arrays, dictionaries, and sets, tuples let us put multiple pieces of data into a single variable, but unlike those other options tuples have a fixed size and can have a variety of data types.
    NOTE:
    - You can't add or remove items from a tuple; they are fixed in size. You can't change the type of items in a tuple; they always have the same types they were created with. You can access items in a tuple using numerical positions or by naming them, but Swift won't let you read numbers or names that don't exist.
    - There are multiple differences between tuples and dictionaries
        When you access values in a dictionary, Swift can’t know ahead of time whether they are present or not. Yes, we knew that user["firstName"] was going to be there, but Swift can’t be sure and so we need to provide a default value.
        When you access values in a tuple, Swift does know ahead of time that it is available because the tuple says it will be available.
        We access values using user.firstName: it’s not a string, so there’s also no chance of typos.
        Our dictionary might contain hundreds of other values alongside "firstName", but our tuple can’t – we must list all the values it will contain, and as a result it’s guaranteed to contain them all and nothing else.
 */

var tup1: (firstName: String, associateName: Int) = (firstName: "Abraham Zayed", associateName: 18)
var tup2 = (name1: String, name2: String, age: Int, networth: Int, isAlive: Bool).self
tup2(name1: "Abraham", name2: "Zayed", age: 18, networth: 1000, isAlive: true)

func getUserTuple() -> (firstName: String, age: Int) {
    return (firstName: "Abraham", age: 19)
}

let userTuple = getUserTuple()
let usertupleName: String = getUserTuple().firstName ; print(usertupleName)
let usertupleAge: Int = getUserTuple().age ; print(usertupleAge)


print("Name: \(userTuple.firstName), age: \(userTuple.age)")


func getUser2() -> (firstName: String, lastName: String) {
    return ("Taylor", "Swift")
}

let user9 = getUser2() ; print("str1: \(getUser2().0) str2:  \(getUser2().1)")
let (firstname, lastname) = getUser2()
print("\(firstname), \(lastname)")
let (firstname1, _) = getUser2()
print("\(firstname1)")



// Functions
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

var randInt10: Int = Int.random(in: -100...0)

func estimateCost(units: Int) -> String {
    switch units {
    case 0...10:
        return "\(units * 10)"
    case 11...50:
        return "\(units * 9)"
    case 51...100:
        return "\(units * 8)"
    default:
        return "We can't make that many."
    }
}


func allTestsPassed(_ tests: [Bool]) -> Bool {
    for test in tests {
        if test == false {
            return false
        }
        continue
    }
    
    
    
    return false
}

allTestsPassed([true, true, false])
allTestsPassed([true, true, true])


func areLettersIdentical(_ str1: String, _ str2: String) -> Bool {
    return str1.sorted() == str2.sorted()
}

areLettersIdentical("abraham", "maharba")

// Because of this, when a function has only one line of code, we can remove the return keyword entirely, like this:
func areLettersIdentical2(_ str1: String, _ str2: String) -> Bool {
    str1.sorted() == str2.sorted()
}
areLettersIdentical2("abraham", "maharba")


func Pythogoras(_ l1: Double, l2: Double) -> Double {
    return sqrt(l1 * l1 + l2 * l2)
}

Pythogoras(3.0, l2: 4.0)

func isUpperCase(_ Str: String) -> Bool {
    return Str == Str.uppercased()
}

isUpperCase("Hello")
isUpperCase("HELLO")

func getUser() -> [String] {
    return ["Taylor", "Swift"]
}

let user = getUser()
print("name: \(user[0]) and \(user[1])")


func getUserDic() -> Dictionary<String, String> {
    return [
        "Name" : "Abraham Zayed",
        "Job" : "Student",
        "Age" : "19"
    ]
}

var newUser = getUserDic()
print("name: \(newUser["Name", default: "no name is registered"]) \n Job: \(newUser["Job", default: "no Job is registered"]), \n Age: \(newUser["Age", default: "no Age is registered"])")





/*
 The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:

 If it’s a multiple of 3, print “Fizz”
 If it’s a multiple of 5, print “Buzz”
 If it’s a multiple of 3 and 5, print “FizzBuzz”
 Otherwise, just print the number.
 */


for i in 1...100 {
    if i.isMultiple(of: 3) {
        print("\(i): Fizz")
    }
    else if i.isMultiple(of: 5) {
        print("\(i): Buzz")
    }
    else if i.isMultiple(of: 5) && i.isMultiple(of: 3) {
        print("\(i): Fizzbuzz")
    }
    else {
        print("\(i): 😢")
    }
}



var number1: Int = 4
var number2: Int = 14
var multiples: [Int] = []

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

var someVar = 10



/*
 Swift gives us two ways to skip one or more items in a loop: continue skips the current loop iteration, and break skips all remaining
 iterations. Like while loops these are sometimes used, but in practice much less than you might think.
 Notes:
    -  This is commonly used near the start of loops, where you eliminate loop variables that don’t pass a test of your choosing.
 */

var fileNamesArr: [String] = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for file in fileNamesArr {
    if file.hasSuffix("jpg") == false {
        continue
    }
    
    print("\(file) is a picture")
}

var roll = 0

while roll != 20 {
    print("I rolled a \(roll)")
    
    roll = Int.random(in: 1...20)
} ; print("I rolled a \(roll)!")



var countdown: Int = 10
while countdown >= 0 {
    print(countdown)
    countdown -= 1
}


let RandomDouble: Double = Double.random(in: 0...1)



func averageWithLimit(_ upperLimit: Int, _ numCount: Int) -> Int {
    var numArr: [Int] = []
    var average: Int = 0
    
    for _ in 1...numCount {
        numArr.append(Int.random(in: 1...upperLimit))
    }
    
    for num in numArr {
        average += num
    }
    return (average / numCount)
}


for _ in 1...100 {
    print(averageWithLimit(100, 100))
}


let hour: Double = 21

print(hour < 20.0 ? "It's still not bed time" : "It's time to sleep!!")



var lyric = "Haters gonna"

for _ in 1...3 {
    for _ in 1...5 { lyric += " hate" }
    print(lyric)
    
    for _ in 1...3 { print("Shake it off, ahh ahh ahh") }
}


func returnTheTimesTableUpToX(_ UpperLimit: Int) {
    
    for i in 1...UpperLimit {
        print("The \(i) times table:")

        for j in 1...UpperLimit {
            print("  \(j) x \(i) is \(j * i)")
        }
        print()
    }
}
returnTheTimesTableUpToX(12)


let week = 1
switch week {
case 1:
    print("Week 1")
    fallthrough
case 2:
    print("Week 2")
default:
    print("Next Month")
}


let day: Int = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}



let T: Bool = true
let F: Bool = false

if T && F {
    print("A * B is true")
}


class LOGIC_GATES {
    
    func AND_GATE(_ boolVars: [Bool]) -> Bool {
        var result: Bool = true
        
        for bool in boolVars {
            result = result && bool
        }
        
        return result
    }

    func OR_GATE(_ boolVars: [Bool]) -> Bool {
        var result: Bool = false
        
        for bool in boolVars {
            result = result || bool
        }
        
        return result
    }

    func NOT_GATE(_ B: Bool) -> Bool{
        return !B
    }
    
    
    var truthValue: Bool = Bool()
    var boolArray: Array<Bool> = []
}


var newTruthValue_Sub: Bool = LOGIC_GATES().truthValue
newTruthValue_Sub = true




let names = ["Eleanor", "Chidi", "Tahani", "Jianyu", "Michael", "Janet"]
var jNames: [String] = []

for name in names {
    if name.hasPrefix("J") {
        jNames.append(name)
    }
}

print(jNames)

var str5: [String] = ["Mark", "Jack", "Mark", "Abraham", "Zayed"]
print(str5.count) ; print(Set(str5))


/*
// Basics
var str = "Hello, playground"
let chars: [Character] = ["A", "B", "R", "A", "H", "A", "M"]
var name: String = ""

for char in chars { name.append(char) }

print(name)

// Makinh Strings

var str2: String = "Str1"
let banner = """
  __,
 (           o  /) _/_
  `.  , , , ,  //  /
(___)(_(_/_(_ //_ (__
             /)
            (/
"""
var n = 10 ; while n > 0 { print(banner) ; n -= 1}
let myName = "Abraham"
let myNameUpper: String = myName.uppercased()
print("\(myName)\n\(myNameUpper)")
let movie = """
A day in
the life of an
Apple engineer
"""
let fileName = "TrumpAngry.jpg"
print(movie.hasPrefix("A day in the life")) ; print(fileName.hasSuffix(".jpg"))


let num1 = 10
var num2 = 2
while num2 < 1_000_000 {
    num2 *= 2
}
num2 += 1 ; print(num2)
let num3 = 120
print(num3.isMultiple(of: 3)) ; print(120.isMultiple(of: 3)) ; print(91.isMultiple(of: 3))

let num4 = 0.1 + 0.2 ; print(num4)
if num4 == 0.3 {print(true)} else {print(false)}
var preciceNum1 : Double = 2.312 // double-precision floating-point number

let a = 1
let b = 2.0
let c = Double(a) + b
// let c = a + b Would produce an error
var rating = 5.0
var num7: Int = 2
rating *= Double(num7)
var cgnum: CGFloat = 2.5
cgnum = CGFloat(rating)


func isAMultipleOf(_ N: Int, _ X: Int) -> Bool {
    if X % N == 0{
        return true
    }
 
    return false
}

isAMultipleOf(2, 8)

var MultipleClosure: ((Int, Int) -> Bool) = { X, N in
    if X % N == 0{
        return true
    }
    
    return false
}

MultipleClosure(10, 10)


var isAuthincated: Bool = true
isAuthincated = !isAuthincated
print(isAuthincated) ; print(!isAuthincated)
 
 struct DemoView: View {
     var body: some View {
         Text("Hello World ")
     }
 }

 struct demoView_Preview: PreviewProvider {
     static var previews: some View { DemoView() }
 }

 func findDervitive(_ f: ((Double) -> Double)) -> Double {
     var result: Double = 0.0
     
     return result
 }


 var f_X: ((Double) -> Double) = { x in
     var dx = 0.0000001
     return ((x + dx) - (x))/dx
 }


 var theSetOfEverything = Set<String>()

 var symbols = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-=§±!@#$%^&*()_+{}:\\./,[]"
 var symbolsArray: [Character] = []

 for l in symbols {
     symbolsArray.append(l)
 }


 func passwordGenWithLenX(_ passLen: Int) -> String {
     var result: String = ""
     var counter: Int = passLen
     
     repeat {
         for _ in 0...symbols.count {
             result.append(symbolsArray[Int.random(in: 0...symbols.count)])
         }
         counter -= 1
     } while counter != 0
     
     return result
 }
*/

var gameOver: Bool = true ; print(gameOver)
gameOver.toggle() ; print(gameOver)


func Celsius_To_Fahrenheit(_ C: Double) -> String {
    return "\(C) Celsius is \(C * 9 / 5 + 32) Fahrenheit"
}
Celsius_To_Fahrenheit(19)

var arrAny: [Any] = []
var strArr: [String] = ["mark", "jack", "Luke"]
var numArr: [Int] = [1, 2, 3]
var boolArr: [Bool] = [true, false, true]

for i in 0...2 { arrAny.append(strArr[i]) ; arrAny.append(numArr[i]) ; arrAny.append(boolArr[i]) } ; print(arrAny)

var scores = Array<Int>()
scores.append(100) ; scores.append(80) ; scores.append(85) ; print(scores[1])

var arrAny2: Array<Any> = ["Hello", 2, true, false, 2.5, 0.0001]
print(strArr.contains("jack"))


strArr.append("abraham") ; print(strArr)
strArr.remove(at: 2) ; print(strArr)
strArr.removeAll() ; print(strArr)

let cities = ["London", "Tokyo", "Rome", "Budapest"] ; print(cities)
print(cities.sorted())
print(cities.reversed())


let alpahbetCapital: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var alphabetArray: [Character] = []
for l in alpahbetCapital { alphabetArray.append(l) } ; print(alphabetArray)

var employeDate: Dictionary<String, String> = ["Name" : "John", "Job" : "Idiot", "Residence": "California"]

for (identfyer, value) in employeDate {
    print("\(identfyer) : \(value)")
}

print(employeDate["Name"] ?? "Value Does not exist")
print(employeDate["job", default: "No Job Listed"])


let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

employeDate["Mark Zuck"] = "Lizard"

// func appendArray<T,M>(_ arr: [T : M]) -> Dictionary<T, M>{ arr[T] = M ; return arr }

let albums = ["Prince": "Purple Rain"]
let beatles = albums["Beatles"]


/*
 So far you’ve learned about two ways of collecting data in Swift: arrays and dictionaries. There is a third very common way to group data,
 called a set – they are similar to arrays, except you can’t add duplicate items, and they don’t store their items in a particular order.
 Note The Following :
    - You might see the names in the original order, but you might also get a completely different order – the set just doesn’t care what order its items come in.
    - You can’t have duplicates and you lose the order of your items - Which is an advantage in certain situations
    - Instead of storing your items in the exact order you specify, sets instead store them in a highly optimized order that makes it very fast to locate items.
*/
var firstSet: Set = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"]) ; print(firstSet)


/*let us define a new data type with a handful of specific values that it can have. Think of a Boolean, that can only have true or false – you
 can’t set it to “maybe” or “probably”, because that isn’t in the range of values it understands. Enums are the same: we get to list up front
 the range of values it can have, and Swift will make sure you never make a mistake using them.
    Note:
    - Although it isn’t visible here, one major benefit of enums is that Swift stores them in an optimized form – when we say Weekday.monday Swift is likely to store that using a single integer such as 0, which is much more efficient to store and check than the letters M, o, n, d, a, 
*/

enum weekday {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
}

enum weekends {
    case friday, saturday
}

var day1 = weekday.sunday
var day2 = weekends.friday

day1 = .monday // You can skip the variable enum assignment after the first one


enum cardSuits {
    case spades
    case hearts
    case diamond
    case clubs
}

var theSetOfSets = Set<Set<Int>>()
var numarr1 = [1,2,3,4,5,6,7,8,9,10]
var numarr2 = [1,2,3,4,5,6,7,8,9,10]

for i in numarr1 { for n in numarr2 { theSetOfSets.insert(Set([i, n])) } } ; print(theSetOfSets)


enum UIStyle {
    case light, dark, system
}

var UIColor = UIStyle.dark
// UIColor = "White" This code is wrong

let userName: String
userName = "@stupidK1d"



var userName1: String
userName1 = "Abraham"

print(userName1)

userName1.removeAll()

