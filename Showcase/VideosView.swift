//
//  VideosView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct VideosView: View {
    
    @State var searchingFor = ""
    @Binding var filteredItems : [Video]
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        NavigationView {
            List {
                    
                ForEach(results) {item in
                    VideoCardView(item: item)
                        .swipeActions {
                            Button {
                                UIPasteboard.general.setValue(item.source,
                                        forPasteboardType: UTType.utf8PlainText.identifier as String)
                            } label: {
                               Label("Copiar", systemImage: "doc.on.doc.fill")
                            }.tint(.pink)
                        }
                }
                .listRowSeparator(.hidden)

            }
            .listStyle(.plain)
            .searchable(text: $searchingFor)
            .navigationTitle("Videos")
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
        }.navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(isDarkMode ? .dark : .light)
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
struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
