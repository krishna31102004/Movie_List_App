//
//  ContentView.swift
//  krishnabalajilab5
//
//  Created by Krishna Balaji on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MovieViewModel()
    @State var showAddMovieSheet = false
    @State var showDeleteAlert = false
    @State var deleteTitle = ""
    @State var newName = ""
    @State var newGenre = ""
    @State var newDescription = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: DetailView(movie: movie)) {
                        HStack {
                            Image(movie.imageName)
                                .resizable()
                                .frame(width: 50, height: 75)
                                .cornerRadius(8)
                            VStack(alignment: .leading) {
                                Text(movie.name).font(.headline)
                                Text(movie.genre).font(.subheadline)
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("My Movies")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddMovieSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddMovieSheet) {
                        addMovieForm()
                    }

                    Button(action: {
                        showDeleteAlert = true
                    }) {
                        Image(systemName: "trash")
                    }
                    .alert("Delete Movie", isPresented: $showDeleteAlert) {
                        VStack {
                            TextField("Enter Movie Name", text: $deleteTitle)
                        }
                        Button("Delete", action: {
                            viewModel.deleteMovie(title: deleteTitle)
                            deleteTitle = ""  // Reset input
                        })
                        Button("Cancel", role: .cancel, action: {})
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    private func addMovieForm() -> some View {
        NavigationView {
            Form {
                TextField("Movie Name", text: $newName)
                TextField("Genre", text: $newGenre)
                TextField("Description", text: $newDescription)
            }
            .navigationTitle("Add Movie")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addMovie(
                            movie: Movie(
                                name: newName,
                                genre: newGenre,
                                description: newDescription,
                                imageName: "default"  
                            )
                        )
                        resetForm()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        resetForm()
                    }
                }
            }
        }
    }
    private func resetForm() {
        newName = ""
        newGenre = ""
        newDescription = ""
        showAddMovieSheet = false
    }
}
#Preview {
    ContentView()
}
