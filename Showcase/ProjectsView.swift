//
//  ProjectsView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct ProjectsView: View {
    
    var startups: [Project] = Projects.startupProjects
    var corporates: [Project] = Projects.corporateProjects
    
    var body: some View {
    
        NavigationView {
            VStack(alignment: .leading){
                
                CardScrollList(
                    selectedCategory: startups,
                    titleText: "Para Startups")
                
                CardScrollList(
                    selectedCategory: corporates,
                    titleText: "Para Corporações",
                    haveSpace: true)
                
            }
            .padding(.top, 12)
            .navigationTitle("Projetos")
        }
    }
}


struct CardScrollList: View {
    
    let selectedCategory: [Project]
    var titleText: String
    var haveSpace = false
    
    var body: some View {
        
        Text(titleText)
            .font(.title2).fontWeight(.medium).opacity(0.6)
            .padding(.leading, 24)
            .padding(.top, 0)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(selectedCategory) { project in
                    NavigationLink(destination: ProjectsDetailView(project: project)) {
                        CardView(project: project)
                    }
                    .foregroundColor(.primary)
                }
            }
            .padding(.bottom, 54)
            .padding(.leading, 24)
            .padding(.trailing, 16)
            
            if haveSpace {
                Spacer()
            }
        }.background(Color(.clear))
    }
}


struct CardView: View {
    @State var show = false
    
    var project: Project
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 0) {

                Spacer()
                
                HStack {
                    Image(project.logoName)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .cornerRadius(8)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(project.title).font(.body).bold()
                        Text(project.description).font(.caption).opacity(0.5).lineLimit(1)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(12)
//                .background(VisualEffectBlurView(blurStyle: .systemThinMaterialDark))
            }
            .frame(width: 225)
            .frame(height: 188)
            .padding(0)
            .background(Image(project.imageName).resizable().scaledToFill())
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color:.black.opacity(0.20), radius: 16, x: 0, y: 18)
        }
    }
}


// PREVIEW
struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
