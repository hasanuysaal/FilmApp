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
    let imdbID : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}

struct ResponseFilms : Codable {
    
    let films : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case films = "Search"
        
    }
    
}
