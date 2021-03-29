//
//  HomeView.swift
//  SwiftUICoreDataAzamSharp
//
//  Created by MD Tanvir Alam on 29/3/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
        NavigationView {
            VStack{
                TextField("MovieName", text: $homeVM.title)
                Button {
                    homeVM.saveMovie()
                    homeVM.getAllMovies()
                    homeVM.title = ""
                } label: {
                    Text("Save")
                }
                List(){
                    ForEach(homeVM.movies, id: \.self) { movie in
                        NavigationLink(destination: MovieDetailView(movie:movie,needRefreash:$homeVM.needRefreash)) {
                            Text(movie.title ?? "No Movie")
                        }
                        
                    }.onDelete { (indexSet) in
                        indexSet.forEach { (index) in
                            let movie = homeVM.movies[index]
                            //Now Delete this movie
                            homeVM.deleteMovie(movie: movie)
                            homeVM.getAllMovies()
                        }
                    }
                }
            }.padding(homeVM.needRefreash ? 8 : 9)
            .onAppear(){
                homeVM.getAllMovies()
            }
            .navigationTitle("Movies")
            
        }.environmentObject(homeVM)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
