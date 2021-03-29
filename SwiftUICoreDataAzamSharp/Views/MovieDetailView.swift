//
//  MovieDetailView.swift
//  SwiftUICoreDataAzamSharp
//
//  Created by MD Tanvir Alam on 29/3/21.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject var homeVM:HomeViewModel
    let movie:Movie
    @Binding var needRefreash:Bool
    var body: some View {
        VStack{
            TextField(movie.title ?? "", text: $homeVM.editedMovieTitle)
                .padding()
            Button {
                
                movie.title = homeVM.editedMovieTitle
                homeVM.updateMovie()
                needRefreash.toggle()
                
            } label: {
                Text("Update")
            }.disabled(homeVM.editedMovieTitle.isEmpty)
            
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(), needRefreash: .constant(false))
    }
}
