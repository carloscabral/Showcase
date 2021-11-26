//
//  TeamView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct TeamView: View {

    @State var team: [Team] = TeamCollection.teamList
    @State var columns: Int = 2
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
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
    @State var showModal = false
    
    var body: some View{
        
        Image(team.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .onTapGesture() {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                ModalView(team: team)
            }
    }
}


struct ModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var team: Team
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack {
                
                Capsule()
                    .frame(width: 52, height: 6)
                    .foregroundColor(.primary.opacity(0.18))
            
            }
            .frame(maxWidth: .infinity, maxHeight: 16, alignment: .center)
            
            Circle()
                .stroke(Color.primary.opacity(0), lineWidth: 1)
                .background(
                    Image(team.imageURL)
                        .resizable()
                        .scaledToFill()
                        
                ).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 60, height: 60)
            
            Text(getFirstName(val: team.name))
                .font(.largeTitle).bold()
            
            Text(getLastName(val: team.name))
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .padding(.bottom, 24)
            
            
            HStack(spacing: 54){
                VStack(alignment: .leading) {
                    Text("Cargo".uppercased()).font(.caption).bold().foregroundColor(.secondary)
                        .frame(height: 8)
                    Text(team.jobTitle)
                        .padding(.bottom, 16)
                }
            
                VStack(alignment: .leading) {
                    Text("Setor".uppercased()).font(.caption).bold().foregroundColor(.secondary)
                        .frame(height: 8)
                    Text(team.jobCategory).padding(.bottom, 16)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Descrição".uppercased()).font(.caption).bold().foregroundColor(.secondary).frame(height: 8)
                Text(team.description).padding(.bottom, 16)
            }.padding(.top, 16)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private func getFirstName(val: String) -> String {
        var firstName = val.components(separatedBy: " ")
        return firstName.removeFirst()
    }
    
    private func getLastName(val: String) -> String {
        var firstName = val.components(separatedBy: " ")
        return firstName.removeLast()
    }
}


// PREVIEW
struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView().previewDevice("iPhone 8")
    }
}
