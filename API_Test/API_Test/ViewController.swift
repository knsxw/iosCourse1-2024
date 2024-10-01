import UIKit
import Alamofire

var movies: [Movie] = []
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let moviesURL = "https://www.dropbox.com/scl/fi/qhgx3vr0x08cvrvzl960f/Movies.json?rlkey=gk2vysittfeipp8f6lw8gspv9&st=x2mung67&dl=1"
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchMovies()
    }
    
    func fetchMovies() {
        AF.request(moviesURL).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    // Decode the JSON into MovieList model
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    movies = movieList.movies
                    print("Movies fetched successfully!")
                    
                    // Reload the table view with the fetched data
                    self.tableView.reloadData()
                } catch {
                    print("Failed to decode movies JSON: \(error)")
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        
        // Populate the custom cell's outlets
        cell.name.text = movie.title
        cell.date.text = "Released: \(movie.releaseDate)"
        
        // Load and set the movie poster image asynchronously
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.poster.image = UIImage(data: data)
                    }
                }
            }
        }
        
        return cell
    }
    
    // Optionally: Handle cell selection if needed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = movies[indexPath.row]
        let detail = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        detail.movie = movie
        navigationController?.pushViewController(detail, animated: true)
    }
}
