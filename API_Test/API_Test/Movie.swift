import Foundation

// MARK: - Movie Model
struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let genres: [String]
    let runtime: Int
    let director: String
    let cast: [CastMember]
    let ratings: Ratings
    let theaters: [Theater]
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, runtime, director, cast, ratings, theaters, genres
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

// MARK: - Cast Member Model
struct CastMember: Codable {
    let name: String
    let role: String
}

// MARK: - Ratings Model
struct Ratings: Codable {
    let imdb: Double
    let rottenTomatoes: Int
    
    enum CodingKeys: String, CodingKey {
        case imdb
        case rottenTomatoes = "rotten_tomatoes"
    }
}

// MARK: - Theater Model
struct Theater: Codable {
    let name: String
    let location: Location
    let showtimes: [String]
}

// MARK: - Location Model
struct Location: Codable {
    let address: String
    let latitude: Double
    let longitude: Double
}

// MARK: - Movie List (Root) Model
struct MovieList: Codable {
    let movies: [Movie]
}

