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
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
    
        NavigationView {
            
            VStack(alignment: .leading){
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Spacer()
                    
                    CardScrollList(
                        selectedCategory: startups,
                        titleText: "Para Startups")
                    
                    CardScrollList(
                        selectedCategory: corporates,
                        titleText: "Para Corporações",
                        haveSpace: true)
                }
                
            }
            .padding(.top, 12)
            .navigationTitle("Projetos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("abacomm-logo-svg")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: (!isDarkMode ? "sun.max" : "moon.stars"))
                        .onTapGesture() {
                            withAnimation(.default) {
                                isDarkMode.toggle()
                            }
                        }
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(
            isDarkMode ? .dark : .light
        )
    }
}


struct CardScrollList: View {
    
    let selectedCategory: [Project]
    var titleText: String
    var haveSpace = false
    
    var body: some View {
        
        Text(titleText)
            .font(.title2).fontWeight(.medium).opacity(0.6)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 24)
            .padding(.top, 0)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(selectedCategory) { project in
                    NavigationLink(destination: ProjectDetailView(project: project)) {
                        CardView(project: project)
                    }
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
                    VStack(alignment: .leading, spacing: 3) {
                        Text(project.title).font(.body).bold()
                        Text(project.description).font(.caption).lineLimit(1)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(.ultraThinMaterial)
                .background(.black.opacity(0.4))
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


// MARK: - PREVIEW
struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
