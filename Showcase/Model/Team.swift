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
    var name: String
    var description: String
    var jobTitle: String
    var jobCategory: String
}

struct TeamCollection {
    
    static let teamList = [
        Team(imageURL: "adrianne", name:"Adrianne Toledo", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "allan", name: "Allan Alexandre", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "carlos", name: "Carlos Cabral", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "douglas", name: "Douglas Fischer", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "fabio", name: "Fábio Dametto", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "filipe", name: "Filipe Neis", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "gabi", name: "Gabriela Salman", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "guilherme", name: "Guilherme Chagas", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "joao", name: "João Gomes", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "junior", name: "Júnior Rodrigues", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "lucas", name: "Lucas Fernandes", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "rachel", name: "Rachel Dalfior", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro"),
        Team(imageURL: "rodrigo", name: "Rodrigo Viana", description: "World; Space the goals the box it at great. The play. Which been about his their to the some copy a concept all I he'd all mister get way. With and from little the production subjective arduous the by his subordinates ride to from frequency; Where the to general duckthemed.", jobTitle: "Desenvolvedor", jobCategory: "Financeiro")
    ]
}
