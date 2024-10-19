//
//  MovieModel.swift
//  krishnabalajilab5
//
//  Created by Krishna Balaji on 10/17/24.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    var name: String
    var genre: String
    var description: String
    var imageName: String
}
