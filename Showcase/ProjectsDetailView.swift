//
//  ProjectsDetailView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct ProjectsDetailView: View {
    
    var project: Project
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProjectsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsDetailView(project: Projects.startupProjects.first!)
    }
}
