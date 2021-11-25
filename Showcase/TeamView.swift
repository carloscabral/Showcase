//
//  TeamView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct TeamView: View {

    @State var team: [Team] = TeamCollection.teamList
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // To show dynamic...
    @State var columns: Int = 2
    
    // Smooth Hero Effect...
    @Namespace var animation
    
    var body: some View {
        
        NavigationView{
            
            ScrollView {
                
                StaggeredGrid(columns: columns, list: team, content: { team in
                    
                    TeamCardView(team: team)
                        .matchedGeometryEffect(id: team.id, in: animation)
                })
                .padding(.horizontal)
            }
            .navigationTitle("O time")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("abacomm-logo-svg")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if !(columns == 6) { columns += 1 }
                    } label: {
                        Image(systemName: "plus").tint(.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        columns = max(columns - 1, 1)
                    } label: {
                        Image(systemName: "minus").tint(.primary)
                    }
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
            .animation(.easeInOut, value: columns)
        }
    }
}


struct TeamCardView: View{
    
    var team: Team
    
    var body: some View{
        
        Image(team.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}


// PREVIEW
struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
