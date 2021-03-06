//
//  ContentView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        SplashScreen()
    }
}


struct HomeView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab: String = "rectangle.stack"
    @State var filteredItems: [Video] = Videos.videoList
    
    var body: some View {
            
        VStack(spacing: 0) {
            
            TabView(selection: $selectedTab) {
                
                ProjectsView().tag("rectangle.stack")
                
                VideosView(filteredItems: $filteredItems).tag("video")
                
                TeamView().tag("person.2")
            }
            CustomTabView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }
}



struct SplashScreen: View{
    
    @State var splashAnimation: Bool = false
    @State var removeSplashScreen: Bool = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        
        ZStack{
            
            HomeView().opacity(splashAnimation ? 1: 0)
            
            
            if !removeSplashScreen{
                
                Color("App-Start")
                // Masking With Abacomm SVG Image...
                // Since Xcode 12, we can directly use svg from assets catalouge....
                    .mask(
                        // Reverse masking with the help of bending....
                        Rectangle()
                            .overlay(
                            
                                Image("abacomm-logo-svg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .scaleEffect(splashAnimation ? 35 : 1)
                                    .blendMode(.destinationOut)
                            )
                    )
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                
                withAnimation(.easeInOut(duration: 0.7)){
                    splashAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    removeSplashScreen = true
                }
            }
        }
    }
}


// PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
}
