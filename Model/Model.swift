//
//  DataForGrid.swift
//  Movies
//
//  Created by Bacho Bitsadze on 04.09.21.
//

import Foundation

struct MoviesData: Decodable {
     
    var movies = [Movie]()
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
   
}

struct Movie: Decodable {
    
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
    
}







//struct MoviesInfo {
//
//
//    let moviePoster: UIImage
//    let popularity: Float
//    let topRated: Int
//    let title: String
//    let overview: String
//    let originalTitle: String
//    let rating: Int
//    let releaseDate: String
//    let isFavorite: Bool
//
//    init(moviePoster: UIImage, popularity: Float, topRated: Int, title: String, overview: String, originalTitle: String, rating: Int, releaseDate: String, isFavorite: Bool) {
//
//        self.moviePoster = moviePoster
//        self.popularity = popularity
//        self.topRated = topRated
//        self.title = title
//        self.overview = overview
//        self.originalTitle = originalTitle
//        self.rating = rating
//        self.releaseDate = releaseDate
//        self.isFavorite = isFavorite
//
//    }
//
//}
