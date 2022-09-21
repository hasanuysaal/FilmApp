//
//  ContentView.swift
//  FilmApp
//
//  Created by Hasan Uysal on 19.09.2022.
//

import SwiftUI

struct FilmListView: View {
    
    @ObservedObject var filmListViewModel : FilmListViewModel
    
    @State var searchingFilm = ""
    
    init() {
        
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.searchFilms(filmName: "leon")
        
    }
     
    var body: some View {
        NavigationView {
            
        VStack {
        TextField("Search Films", text: $searchingFilm) {
            self.filmListViewModel.searchFilms(filmName: searchingFilm)
        }.padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
        List(filmListViewModel.films, id: \.imdbID) { film in
            HStack(alignment: .top) {
                CustomizedImage(url: film.poster)
                    .frame(width: 60, height: 70)
            
                VStack(alignment: .leading){
                    Text(film.title)
                        .font(.body)
                        .foregroundColor(Color.pink)
                        .fontWeight(.bold)
                    Text(film.year)
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(Color.indigo)
                }
            }
        }.navigationTitle(Text("FilmApp"))
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
