import UIKit

struct Entity {
    var name: String {
        didSet {
            print("Hey name \(name) has been changed")
        }
    }
    mutating func changeName() {
        name = "Shipra"
    }
    func toString() -> String {
        return "name : \(name)"
    }
}

var e: Entity = Entity(name: "Abhishek");
print(e.toString());
e.changeName();
print(e.toString());

struct EntityWithDefaultAge {
    var name: String;
    var Age: Int = 29;
    init() {
        name =  "Unknown";
    Age =  40
    }
}
var e3 = EntityWithDefaultAge();
e3.name;

// Classes
//Difference between a class and a struct is a class does not have memberwise initialization. They have to be initialized using init keyword
class EntityClass {
    var name: String;
    var Age: Int;
    var type: String;
    init(name: String, Age: Int, type: String) {
        self.name = name;
        self.Age = Age;
        self.type=type;
    }
};
class Person : EntityClass {
    init(name: String, Age: Int){
        super.init(name: name, Age: Age, type: "Person")
    }
}
let p = Person(name: "Abhishek", Age: 29);
print(p.type)
