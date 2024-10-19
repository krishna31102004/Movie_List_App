//
//  DetailView.swift
//  krishnabalajilab5
//
//  Created by Krishna Balaji on 10/17/24.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: UIImage(named: movie.imageName) ?? UIImage(named: "default")!)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(12)

            Text(movie.name)
                .font(.largeTitle)
                .bold()

            Text(movie.genre)
                .font(.title2)
                .foregroundColor(.secondary)

            Text(movie.description)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(movie.name)
    }
}
