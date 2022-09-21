//
//  FilmDetailViewModel.swift
//  FilmApp
//
//  Created by Hasan Uysal on 21.09.2022.
//

import Foundation

class FilmDetailViewModel : ObservableObject {
    
    @Published var filmDetail : DetailViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getFilmDetails(imdbId: String) {
        downloaderClient.downloadFilmDetails(imdbId: imdbId) { (result) in
            switch result {
                case .failure(let error):
                    print ("error")
            
                case .success(let filmDetail):
                    DispatchQueue.main.async {
                        self.filmDetail = DetailViewModel(detail: filmDetail)
                    }
                    
            
            }
        }
    }
    
    
    
}


struct DetailViewModel {
    
    let detail : FilmDetail
    
    var title : String {
        detail.title
    }
    var year : String {
        detail.year
    }
    var runTime : String {
        detail.runTime
    }
    var genre : String {
        detail.genre
    }
    var director : String {
        detail.director
    }
    var actors : String {
        detail.actors
    }
    var plot : String {
        detail.plot
    }
    var language : String {
        detail.language
    }
    var awards : String {
        detail.awards
    }
    var poster : String {
        detail.poster
    }
    var metascore : String {
        detail.metascore
    }
    var imdbRating : String {
        detail.imdbRating
    }
    
}
