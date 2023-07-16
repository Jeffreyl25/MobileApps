// Loops Hackwich

var stupidIdeas = ["Play tag on highway", "Shout \"Fire\" in a crowded room", "Forget your CTD lanyard", "Throw water balloons inside", "Play frogger in real life", "Break a TV", "Dump water on toaster", "Bite Uranium"]

for stupidIdea in stupidIdeas {
    //print("Don't ever do the following: \(stupidIdea)")
}

for number in 1...100 {
    if (number % 5 == 0) {
        //print("\(number) is divisible by 5")
    }
}

for number in 0..<10 {
    print(number)
}

for index in 0..<stupidIdeas.count {
    print(stupidIdeas[index])
}

var stuff = ["First thing", "Second thing", "Third thing", "Fourth thing", "Fifth thing"]
while stuff.count > 0 {
    print(stuff)
    stuff.removeLast()
}

var number = 5
while number > 0 {
    print(number)
    number -= 1
}
