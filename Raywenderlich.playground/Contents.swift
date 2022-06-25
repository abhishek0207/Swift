import Foundation


FileManager.documentDirectoryURL

let s : String = "Abhishek"
let sURL : URL = URL(fileURLWithPath: s, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
sURL.path
var newURL : URL = URL(fileURLWithPath: "newString", relativeTo: FileManager.documentDirectoryURL)
newURL.appendPathExtension("txt")
let someData = try s.write(to: newURL, atomically: true, encoding: .utf8)
let someDataRead = try String(contentsOf : newURL)
