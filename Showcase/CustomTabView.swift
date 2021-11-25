//
//  CustomTabView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0) {
            
            TabBarButton(animation: animation, image: "rectangle.stack", selectedTab: $selectedTab)
            
            TabBarButton(animation: animation, image: "video", selectedTab: $selectedTab)
            
            TabBarButton(animation: animation, image: "person.2", selectedTab: $selectedTab)
        }
        .frame(height: 50)
        .padding(.vertical)
        .background(.ultraThinMaterial)
    }
}


struct TabBarButton: View {
    
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) { selectedTab = image }
        }, label: {
            VStack(spacing: 8) {
                
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color.primary : Color.primary.opacity(0.5))
                
                if selectedTab == image {
                    Circle()
                        .fill(Color.pink)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
            }
            .frame(maxWidth: .infinity)
            
            .offset(y: -10)
        })
    }
}



// PREVIEW
struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
