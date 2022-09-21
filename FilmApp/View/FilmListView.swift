//
//  ContentView.swift
//  FilmApp
//
//  Created by Hasan Uysal on 19.09.2022.
//

import SwiftUI

struct FilmListView: View {
    
    @ObservedObject var filmListViewModel : FilmListViewModel
    
    init() {
        
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.searchFilms(filmName: "leon")
        
    }
     
    var body: some View {
        List(filmListViewModel.films, id: \.imdbID) { film in
            HStack(alignment: .top) {
                Image("poster")
                    .resizable()
                    .frame(width: 60, height: 70)
            
                VStack(alignment: .leading){
                    Text(film.title)
                        .font(.title3)
                        .foregroundColor(Color.pink)
                        .fontWeight(.bold)
                    Text(film.year)
                        .fontWeight(.regular)
                        .foregroundColor(Color.indigo)
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           FilmListView()
                .previewDevice("iPhone 11")
                .previewDisplayName("iPhone 11")
                    
           FilmListView()
                .previewDevice("iPhone 8")
                .previewDisplayName("iPhone 8")
        }
    }
}
