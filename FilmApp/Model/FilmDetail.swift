//
//  FilmDetail.swift
//  FilmApp
//
//  Created by Hasan Uysal on 21.09.2022.
//

import Foundation

struct FilmDetail : Codable{
    
    let title : String
    let year : String
    let runTime : String
    let genre : String
    let director : String
    let actors : String
    let plot : String
    let language : String
    let awards : String
    let poster : String
    let metascore : String
    let imdbRating : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        
    }
    
}
