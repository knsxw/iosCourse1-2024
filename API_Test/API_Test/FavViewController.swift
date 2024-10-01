import UIKit

class FavViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var fav: [Movie] = []
    
    @IBOutlet var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // Call super method
        fav = movies.filter { movie in
            Favorite.contains { favorite in movie.title == favorite }
        }
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fav.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavCollectionViewCell
        
        let movie = fav[indexPath.item] // Use indexPath.item directly
        cell.name.text = movie.title
        cell.rating.text = "\(movie.ratings.imdb)" // Access a specific rating
        
        // Load the image
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        cell.image.image = UIImage(data: data)
                    }
                } else {
                    print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
        
        return cell
    }
}
