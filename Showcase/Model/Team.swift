//
//  Team.swift
//  Showcase
//
//  Created by Carlos Cabral on 24/11/21.
//

import SwiftUI

struct Team: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}

struct TeamCollection {
    
    static let teamList = [
        Team(imageURL: "adrianne"),
        Team(imageURL: "allan"),
        Team(imageURL: "carlos"),
        Team(imageURL: "douglas"),
        Team(imageURL: "fabio"),
        Team(imageURL: "filipe"),
        Team(imageURL: "gabi"),
        Team(imageURL: "guilherme"),
        Team(imageURL: "joao"),
        Team(imageURL: "junior"),
        Team(imageURL: "lucas"),
        Team(imageURL: "rachel"),
        Team(imageURL: "rodrigo")
    ]
}
