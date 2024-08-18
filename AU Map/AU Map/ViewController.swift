//
//  ViewController.swift
//  AU Map
//
//  Created by Sasori on 17/8/2567 BE.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    var places: [AUPlace] = []
    
    let auCenter = CLLocationCoordinate2D(latitude: 13.612320, longitude: 100.836808)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let region = MKCoordinateRegion(center: auCenter, latitudinalMeters: 1000, longitudinalMeters: 1000)
                mapView.setRegion(region, animated: true)
        
        if let places = parseJSON() {
            self.places = places
            print(places)
            for place in places {
                let annotation = MKPointAnnotation()
                annotation.title = place.facultyName
                annotation.subtitle = place.abbreviation
                annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
                mapView.addAnnotation(annotation)
            }
        }
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "AUPlacePin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true

                let detailButton = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = detailButton
            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }
    
    // Handle tap on callout detail button
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation {
                showAlert(for: annotation)
            }
        }
        
        // Show alert with faculty name and coordinates
        func showAlert(for annotation: MKAnnotation) {
            let title = annotation.title ?? "Unknown Place"
            let coordinate = annotation.coordinate
            let annotationLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                    let auCenterLocation = CLLocation(latitude: auCenter.latitude, longitude: auCenter.longitude)
                    let distance = annotationLocation.distance(from: auCenterLocation) // distance in meters
                    
                    // Format distance
                    let distanceInKm = distance / 1000.0 // Convert meters to kilometers
                    let distanceFormatted = String(format: "%.2f km", distanceInKm)
                    
                    let message = "Coordinates: \(coordinate.latitude), \(coordinate.longitude)\nDistance from AU Center: \(distanceFormatted)"
            
            let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }
}

