// Array is an ordered list of things
// [] array notation

var array: [String] // declare the array
array = [String]() // initialize an empty array
array.append("ABC")

var names: [String] = ["Tom", "Riley", "Gaby"]
names.append("Andrew") //adds to the end
names += ["Ruth"]

print(names)

var typeInferenceArray = [1, 2, 3, 4, 5]
type(of: typeInferenceArray)

var repeatingArray = Array(repeating: "X", count: 17)
print(repeatingArray)

var letters = ["a", "b"]
letters += ["c"]
letters.count
letters.first
letters[0]
letters.last
letters[letters.count - 1] //same as last

var emptyArray = [Int]()
emptyArray.isEmpty
emptyArray += [2]
emptyArray.isEmpty

var familyMembers = ["Connor", "Denise", "David"]
familyMembers.count
"You have \(familyMembers.count) members in your family"
let david = familyMembers[2]
let connor = familyMembers[0]
familyMembers.remove(at: 0)
familyMembers
familyMembers.insert("Connor", at: 1)
familyMembers.contains("Denise")
familyMembers.firstIndex(of: "David")

var mutableArray = [String]() // can edit
let imutableArray = [String]() // cannot edit

var anyTypeArray: [Any] = ["string", 1, 3.14, false]
