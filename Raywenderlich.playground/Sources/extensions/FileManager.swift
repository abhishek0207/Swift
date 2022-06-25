import Foundation

public extension FileManager {
    static var documentDirectoryURL : URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
