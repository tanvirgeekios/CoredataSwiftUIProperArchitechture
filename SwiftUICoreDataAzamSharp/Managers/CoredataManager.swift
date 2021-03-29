//
//  CoredataManager.swift
//  SwiftUICoreDataAzamSharp
//
//  Created by MD Tanvir Alam on 29/3/21.
//

import Foundation
import CoreData

class CoredataManager{
    
    static let shared = CoredataManager()
    
    let persistentContainer:NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "MovieList")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error{
                fatalError("CoreData store failed \(error.localizedDescription)")
            }
        }
    }
    
    func deleteMovie(movieToDelete:Movie){
        persistentContainer.viewContext.delete(movieToDelete)
        do{
            try persistentContainer.viewContext.save()
            print("Success Deleting Movie")
        }catch{
            print("Error Deleting Movie\(error)")
        }
    }
    
    func getAllMovies()->[Movie]{
        let fetchRequest:NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do{
            let movies = try persistentContainer.viewContext.fetch(fetchRequest)
            return movies
        }catch{
            return []
        }
    }
    
    func saveMovie(title:String){
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do{
            try persistentContainer.viewContext.save()
            print("Saving Sucess")
        }catch{
            print("Failed to save movie\(error)")
        }
    }
    func updateMovie(){
        do{
            try persistentContainer.viewContext.save()
            print("Updating Sucess")
        }catch{
            print("Failed to update movie\(error)")
        }
    }
}
