//
//  MovieViewModel.swift
//  krishnabalajilab5
//
//  Created by Krishna Balaji on 10/17/24.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [
        Movie(name: "3 Idiots", genre: "Drama", description: "A story about three friends and their life journey.", imageName: "idiots"),
        Movie(name: "Dangal", genre: "Sports", description: "A biopic on a wrestler's fight to train his daughters.", imageName: "dangal"),
        Movie(name: "Inception", genre: "Sci-Fi", description: "A mind-bending thriller.", imageName: "inception"),
        Movie(name: "The Dark Knight", genre: "Action", description: "The rise of a hero.", imageName: "dark_knight"),
        Movie(name: "Titanic", genre: "Romance", description: "A tragic love story.", imageName: "titanic")
    ]
    func addMovie(movie: Movie) {
        movies.append(movie)
        sortMovies()
    }
    func deleteMovie(title: String) {
        movies.removeAll { $0.name.lowercased() == title.lowercased() }
    }
    func sortMovies() {
        movies.sort { $0.name.lowercased() < $1.name.lowercased() }
    }
}
