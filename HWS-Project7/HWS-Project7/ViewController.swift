//
//  ViewController.swift
//  HWS-Project7
//
//  Created by Ahuja, Abhishek on 4/20/22.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        var urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        if navigationController?.tabBarItem.tag == 1 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        DispatchQueue.global().async {
        if let url  = URL(string:urlString) {
                if let data = try? Data(contentsOf: url) {
                    self.parse(json: data)
                }

            }
        }
        // Do any additional setup after loading the view.
    }
    func parse(json : Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let p = petitions[indexPath.row]
        cell.textLabel?.text =  p.title
        cell.detailTextLabel?.text = p.body
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

