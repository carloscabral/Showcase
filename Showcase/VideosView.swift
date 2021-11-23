//
//  VideosView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct VideosView: View {
    
    @State var searchingFor = ""
    @Binding var filteredItems : [Video]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(results) {item in
                    VideoCardView(item: item)
                }.listRowSeparator(.hidden)
            }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .searchable(text: $searchingFor)
            .navigationTitle("Videos")
        }
    }
    
    var results: [Video] {
            return searchingFor.isEmpty ? filteredItems : filteredItems
                .filter {$0.name.lowercased().contains(searchingFor.lowercased())
        }
    }
}

struct VideoCardView: View {
    
    var item: Video
    
    var body: some View {
        
        Link(destination: URL(string: item.source)!, label: {
            
            HStack {
                
                ZStack {
                    
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 120, height: 74)
                        .scaledToFill()
                        .overlay(Color(.black).opacity(0.35))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 10)
                    
                    Image(systemName: "play.fill").font(.largeTitle).foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.name).font(.title3).bold()
                    Text(item.description).font(.caption).opacity(0.7).lineLimit(3)
                }
                .padding(.leading, 12)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 0)
            
        }).foregroundColor(.primary)
    }
}

// PREVIEW
//struct VideosView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideosView()
//    }
//}