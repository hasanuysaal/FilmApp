//
//  FilmViewModel.swift
//  FilmApp
//
//  Created by Hasan Uysal on 20.09.2022.
//

import Foundation

class FilmListViewModel : ObservableObject{
    
    
    @Published var films = [FilmViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func searchFilms(filmName: String){
        
        downloaderClient.downloadFilms(search: filmName) { (result) in
            
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let filmArr):
                    if let filmArr = filmArr {
                        DispatchQueue.main.async {
                            self.films = filmArr.map(FilmViewModel.init)
                        }
                        
                }
            }
            
        }
        
    }
    
    
}

struct FilmViewModel {
    
    var film : Film
    
    var title : String {
        film.title
    }
    
    var year : String {
        film.year
    }
    
    var type : String {
        film.type
    }
    
    var poster : String {
        film.poster
    }
    
    
}
