//
//  HomeVIewModel.swift
//  SwiftUICoreDataAzamSharp
//
//  Created by MD Tanvir Alam on 29/3/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var title = ""
    @Published var movies:[Movie] = []
    @Published var editedMovieTitle = ""
    @Published var needRefreash = false
    
    func saveMovie(){
        CoredataManager.shared.saveMovie(title: title)
    }
    func getAllMovies(){
        movies = CoredataManager.shared.getAllMovies()
    }
    func deleteMovie(movie:Movie){
        CoredataManager.shared.deleteMovie(movieToDelete: movie)
    }
    func updateMovie(){
        CoredataManager.shared.updateMovie()
    }
}
