//
//  ListViewController.swift
//  AU Map
//
//  Created by Sasori on 17/8/2567 BE.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var places: [AUPlace] = []
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let places = parseJSON() {
            self.places = places
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func parseJSON() -> [AUPlace]? {
        // Find the JSON file in the app bundle
        guard let url = Bundle.main.url(forResource: "abac_location", withExtension: "json") else {
            print("JSON file not found.")
            return nil
        }
        
        do {
            // Load the JSON data
            let data = try Data(contentsOf: url)
            
            // Decode the JSON into a dictionary
            if let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let placesArray = jsonDict["Places"] as? [[String: Any]] {
                
                var places: [AUPlace] = []
                
                // Iterate over the array of dictionaries
                for placeDict in placesArray {
                    if let facultyName = placeDict["FacultyName"] as? String,
                       let abbreviation = placeDict["Abbreviation"] as? String,
                       let imageLogoName = placeDict["ImageLogoName"] as? String,
                       let latitude = placeDict["LocationLat"] as? Double,
                       let longitude = placeDict["LocationLong"] as? Double {
                        
                        // Create an AUPlace object and append it to the array
                        let place = AUPlace(facultyName: facultyName, abbreviation: abbreviation, imageLogoName: imageLogoName, latitude: latitude, longitude: longitude)
                        places.append(place)
                    }
                }
                return places
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AUTableViewCell
        cell.title.text = places[i].facultyName
        cell.imageLogo.image = UIImage(named: places[i].imageLogoName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

