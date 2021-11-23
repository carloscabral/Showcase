//
//  ContentView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: String = "rectangle.stack"
    @State var filteredItems: [Video] = Videos.videoList
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $selectedTab) {
                ProjectsView().tag("rectangle.stack")
                
                TeamView().tag("person.2")
                
                VideosView(filteredItems: $filteredItems).tag("video")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            CustomTabView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
