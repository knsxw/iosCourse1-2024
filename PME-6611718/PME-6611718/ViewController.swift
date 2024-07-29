//
//  ViewController.swift
//  PME-6611718
//
//  Created by Sasori on 27/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! myTableViewCell
        let res = restaurants[indexPath.row]
        cell.resName.text = res.name
        cell.resImage.image = UIImage(named: res.images[0])
        cell.resLocation.text = res.location
        cell.resTime.text = "🕒\(res.openingTime)"
        cell.resPrice.text = "💲\(res.price)"
        cell.resRating.text = "\(res.rating) ⭐⭐⭐⭐"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "restView") as! ResViewController
        resPage.restaurant = restaurants[indexPath.row]
        navigationController?.pushViewController(resPage, animated: true)
    }

    @IBOutlet weak var resTable: UITableView!
     
    var restaurants: [Restaurant] = []
    var favorites: [Restaurant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        resTable.delegate = self
        resTable.dataSource = self
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        if let jsonData = readJSONFromFile(fileName: "restaurants") {
            if let restaurants = parseJSON(data: jsonData) {
                self.restaurants = restaurants
                resTable.reloadData()
            }
        }
    }

    
    func readJSONFromFile(fileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: "Restaurants", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return data
            } catch {
                print("Error reading JSON file: \(error)")
            }
        }
        return nil
    }
        
        func parseJSON(data: Data) -> [Restaurant]? {
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(Root.self, from: data)
                return root.items
            } catch {
                print("Error parsing JSON data: \(error)")
            }
            return nil
        }
}

