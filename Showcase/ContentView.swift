//
//  ContentView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: String = "rectangle.stack"
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $selectedTab) {
                ProjectsView().tag("rectangle.stack")
                
                TeamView().tag("person.2")
                
                VideosView().tag("video")
            }
            
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
