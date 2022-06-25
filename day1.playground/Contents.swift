import UIKit

var greeting = "Hello, playground"
greeting = "Abhishek "
var age = 28
var message = "My age is : \(age)"
let taylor = "swift"
let beatles: [String] = ["John", "Paul", "Ringo"]
beatles[2]
beatles[1]
var name = (something: "Taylor", last: "Swift")
name.something
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Ed Sheeran"]
for n in beatles {
    print(n)
}


func some_func(message : String) {
    print("Hey just called from the function \(message)")
}
func some_func_no_param_label(_ message : String) {
    print("Hey just called from the function \(message)")
}
some_func(message : "This is a message")
some_func_no_param_label("this is message 2")

//variadic functions in swift

func friends(_ names: String...) {
    print("the names of my friends are ")
    for name in names {
        print(name)
    }
}
friends("shipra", "Nipun", "Shashank")

//Closures
let driving =  { (param : String) -> String in
    print("I am in a closure")
    print("You sent the argument as \(param)")
    return "hurray it worked"
}
//let val = driving( "Parameter for closure")
//print(val)
func another_sample_function(closure : (String) -> String ) {
    print("inside another sample function")
    let msg = closure("The parameter");
    print(msg)
}
another_sample_function(closure: driving)

//closuer accepting a parameter

func a_function_that_calls_closure(closure : (String) -> String) {
    print("hey i am in a function that calls another function");
    var msg = closure("Umm Should be in the closuer");
    print("message from closure is \(msg)")
    print("closuer executed ")
}
//a_function_that_calls_closure { (msg : String) in
//    return msg;
//}

//another way of writing closures since when we call `a_function_that_calls_Closure`, swift already knows what should be the parameter so no need to define it again
a_function_that_calls_closure{ msg in
    return msg; //definition of closure function
};

struct Entity {
    var name: String {
        didSet {
            print("Hey name \(name) has been set")
        }
    }
}
var e: Entity = Entity(name: "Abhishek");
