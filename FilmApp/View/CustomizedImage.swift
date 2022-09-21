//
//  CustomizedImage.swift
//  FilmApp
//
//  Created by Hasan Uysal on 21.09.2022.
//

import SwiftUI

struct CustomizedImage: View {
    
    let url : String
    @ObservedObject var downloaderClient = DownloaderClient()
    
    init(url: String) {
        self.url = url
        self.downloaderClient.downloadImages(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.downloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("poster")
                .resizable()
        }
    }
}

struct CustomizedImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
