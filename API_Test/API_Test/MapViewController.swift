import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var movie: Movie? // This will hold the selected movie
    @IBOutlet var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the map view's delegate if needed
        map.delegate = self
        
        // Add theater annotations to the map if movie is not nil
        if let movie = movie {
            addTheaterAnnotations(for: movie)
        }
    }
    
    private func addTheaterAnnotations(for movie: Movie) {
        for theater in movie.theaters {
            let annotation = MKPointAnnotation()
            annotation.title = theater.name
            annotation.subtitle = theater.location.address // Optional: Add address as subtitle
            annotation.coordinate = CLLocationCoordinate2D(latitude: theater.location.latitude, longitude: theater.location.longitude)
            map.addAnnotation(annotation)
        }
        
        // Optionally, center the map on the first theater's location
        if let firstTheater = movie.theaters.first {
            let initialLocation = CLLocation(latitude: firstTheater.location.latitude, longitude: firstTheater.location.longitude)
            centerMapOnLocation(location: initialLocation)
        }
    }
    
    private func centerMapOnLocation(location: CLLocation, radius: CLLocationDistance = 10000) {
        let regionRadius = radius
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
}

// Conform to MKMapViewDelegate if you need to customize annotations
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "TheaterPin"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}
