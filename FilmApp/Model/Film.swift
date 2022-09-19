//
//  Film.swift
//  FilmApp
//
//  Created by Hasan Uysal on 19.09.2022.
//

import Foundation

struct Film : Codable {
        
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbId"
        case type = "Type"
        case poster = "Poster"
    }
    
}

struct responseFilms {
    
    var films : [Film]
    
    private enum Codingkeys : String, CodingKey {
        case films = "Search"
    }
    
}
