//
//  FavouriteViewController.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var restaurants: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let result = readJSONFile(named: "Restaurants", withExtension: "json") {
            restaurants = result.restaurants
            restaurants = restaurants.filter { r in
                FAV_RESTAURANTS.contains { name in r.name == name }
            }
            tableView.reloadData()
        }
    }

    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> RestaurantClass? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the AppInfo struct
                let appInfo = try JSONDecoder().decode(RestaurantClass.self, from: data)
                return appInfo
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }

}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantcell") as! RestaurantCell
        cell.displayName.text = restaurants[i].name
        cell.displayLocation.text = restaurants[i].location
        cell.displayRating.text = "\(restaurants[i].rating)"
        cell.displayTime.text = restaurants[i].openingTime
        cell.displayPrice.text = restaurants[i].price
        cell.displayImage.image = UIImage(named: restaurants[i].images[0])
        cell.displayStars(numberOfRating: restaurants[i].rating)
        cell.heartImage.image = UIImage(systemName: "heart.fill")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScene = storyboard?.instantiateViewController(identifier: "detailviewcontroller") as! DetailViewController
        detailScene.restaurant = restaurants[indexPath.row]
        
        navigationController?.pushViewController(detailScene, animated: true)
    }
    
}
