//
//  ContentView.swift
//  FilmApp
//
//  Created by Hasan Uysal on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      //TEST
        Button {
            DownloaderClient().downloadFilms(search: "titan") { (result) in
                switch result {
                    case .success(let filmArr):
                        print(filmArr)
                    case .failure(let error):
                        print(error)
                }
            }
        } label: {
            Text("Get Data")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
