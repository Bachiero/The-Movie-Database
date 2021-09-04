//
//  ApiService.swift
//  Movies
//
//  Created by Bacho Bitsadze on 04.09.21.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getPopularmoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void) {
        
        let popularMoviesUrl = "https://api.themoviedb.org/3/movie/550?api_key=027fe7e03f2f2a36398c260c85c30ca4"
        
        guard let url = URL(string: popularMoviesUrl) else {return}
        
        
        
        dataTask = URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
                
            }
            guard (response as? HTTPURLResponse) != nil else {
                print("Empty Response")
                return
            }
            guard let data = data else {
                print("Empty Data")
                return
            }
        
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            
    } catch let error {
                    completion(.failure(error))
                }
            
    }
        dataTask?.resume()
}
}
