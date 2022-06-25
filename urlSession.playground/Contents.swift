import Foundation

let urlConfiguration =  URLSessionConfiguration.default
let urlSession = URLSession(configuration: urlConfiguration)
guard let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=cohen") else {
    fatalError("Could not find the url")
}
let task = urlSession.dataTask(with: url) {
    data, response, error in
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
        fatalError("Did not return valid response")
    }
    guard let data = data else {
        fatalError("Invalid data")
    }
    if let result = String(data : data, encoding: .utf8)  {
        print(result)
    }
}
task.resume()

