//
//  DetailViewController.swift
//  API_Test
//
//  Created by Sasori on 1/10/2567 BE.
//

import UIKit

var Favorite : [String] = []
class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let movie = movie {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            runtimeLabel.text = "\(movie.runtime) minutes"
            ratingLabel.text = "IMDb: \(movie.ratings.imdb)"
            castLabel.text = movie.cast.map { $0.name }.joined(separator: ", ")
                    
                    // Load the poster image (you may need to use an image loader)
            if Favorite.contains( movie.title) {
                heartBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                heartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.posterImageView.image = UIImage(data: data)
                        }
                    } else {
                        print("Failed to load image data from URL: \(url)")
                        // Optionally set a placeholder image
                        DispatchQueue.main.async {
                            self.posterImageView.image = UIImage(named: "placeholder") // Use a placeholder image
                        }
                    }
                }
            } else {
                print("Invalid URL for image: \(movie.posterPath)")
                // Optionally set a placeholder image
                posterImageView.image = UIImage(named: "placeholder") // Use a placeholder image
            }
            
        }
        
    }
    @IBAction func favoriteClick() {
        print("click")
        if let movie = movie {
            if Favorite.contains(movie.title) {
                if let index = Favorite.firstIndex(of: movie.title) {
                    Favorite.remove(at: index)
                    heartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                }
            } else {
                Favorite.append(movie.title)
                heartBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                print(Favorite)
            }
        } else {
            print("No Data")
        }
    }

    @IBAction func mapClick(_ sender: Any) {
        print("map")
        let map = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "mapView") as! MapViewController
        map.movie = movie
        navigationController?.pushViewController(map, animated: true)
    }
}
