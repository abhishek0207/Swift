import Foundation // foundation contains swift

var width  : Float  = 5.6
var height : Float = 2.3
var coveredAreaPerBucket : Float = 1.5

var bucketsOfPaint : Int {
    get {
    return Int(ceilf((width * height) / coveredAreaPerBucket))
    }
    set {
        let totalAreaCovered = Float(newValue) * coveredAreaPerBucket
        print("total Area Covered is \(totalAreaCovered)")
    }
}

print(bucketsOfPaint)

bucketsOfPaint = 10

