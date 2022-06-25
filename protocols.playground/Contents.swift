import UIKit;

protocol my_protocol {
    var name: String{ get set};
};

struct some_struct : my_protocol {
    var Age: Int;
    var name: String;
};

let s = some_struct(Age: 29, name: "abhishek")
print(s.name)
extension some_struct {
    func getNAmeAndAge() -> String {
        return "This guy is \(name) && \(Age)";
    }
};
print(s.getNAmeAndAge())
