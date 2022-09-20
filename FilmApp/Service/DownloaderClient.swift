//
//  DownloaderClient.swift
//  FilmApp
//
//  Created by Hasan Uysal on 20.09.2022.
//

import Foundation

class DownloaderClient {
    
    func downloadFilms (search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=ecc6037a") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataCantGet))
            }
            
            
            guard let filmResponse = try? JSONDecoder().decode(ResponseFilms.self, from: data) else {
                return completion(.failure(.dataCantProccess))
            }
            
            completion(.success(filmResponse.films))
            
        }.resume()
        
    }
}

enum DownloaderError: Error {
    
    case wrongUrl
    case dataCantGet
    case dataCantProccess
    
}
