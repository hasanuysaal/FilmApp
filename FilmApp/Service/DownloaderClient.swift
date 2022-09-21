//
//  DownloaderClient.swift
//  FilmApp
//
//  Created by Hasan Uysal on 20.09.2022.
//

import Foundation

class DownloaderClient : ObservableObject {
    
    @Published var downloadedImage : Data?
    
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
    
    func downloadImages (url: String){
        
        //check the url is correct
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //check you can get the data
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
            
        }.resume()
        
    }
}

enum DownloaderError: Error {
    
    case wrongUrl
    case dataCantGet
    case dataCantProccess
    
}
