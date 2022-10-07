//
//  FilmDetailView.swift
//  FilmApp
//
//  Created by Hasan Uysal on 21.09.2022.
//

import SwiftUI

struct FilmDetailView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            
            HStack(alignment: .center){
                Spacer()
                VStack{
                    CustomizedImage(url: filmDetailViewModel.filmDetail?.poster ?? "loading")
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                    .cornerRadius(15)
                    .shadow(color: .black, radius: 10, x: 1, y: 1)
                
                    Text(filmDetailViewModel.filmDetail?.title ?? "Title")
                        .font(.title)
                        .foregroundColor(.accentColor)
                        .padding()
                        
                    Text(filmDetailViewModel.filmDetail?.plot ?? "Plot")
                        .italic()
                    
                }
                Spacer()
            }
            
            
            Group{
    
            Text("Year: \(filmDetailViewModel.filmDetail?.year ?? "Year")")
            
            Text("Run Time: \(filmDetailViewModel.filmDetail?.runTime ?? "Run Time")")
            
            Text("Genre : \(filmDetailViewModel.filmDetail?.genre ?? "Genre")")
            
            Text("Director: \(filmDetailViewModel.filmDetail?.director ?? "Director")")
            
            Text("Actors: \(filmDetailViewModel.filmDetail?.actors ?? "Actors")")
            
            Text("Language: \(filmDetailViewModel.filmDetail?.language ?? "Language")")
            
            Text("Awards: \(filmDetailViewModel.filmDetail?.awards ?? "Awards")")
                
            Text("Metascore: \(filmDetailViewModel.filmDetail?.metascore ?? "Metascore")")
                
            Text("imDB Rating: \(filmDetailViewModel.filmDetail?.imdbRating ?? "imDB Rating")")
            }.padding(1)
           
            
        }.onAppear {
            filmDetailViewModel.getFilmDetails(imdbId: imdbId)
        }
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilmDetailView(imdbId: "111")
                .previewDevice("iPhone 11")
                .previewDisplayName("iPhone 11")
                    
            FilmDetailView(imdbId: "111")
                .previewDevice("iPhone 8")
                .previewDisplayName("iPhone 8")
        }
    }
}
