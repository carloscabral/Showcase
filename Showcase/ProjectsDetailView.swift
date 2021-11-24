//
//  ProjectsDetailView.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct ProjectsDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let project: Project
    let maxHeight = UIScreen.main.bounds.height / 2.3
    
    @State var offset: CGFloat = 0
    @State var navBarHidden: Bool = true
    
    var body: some View {
        
        GeometryReader { proxy in
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    GeometryReader{proxy in
                        
                        TopBarView(project: project, maxHeight: maxHeight, offset: $offset)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: getHeaderHeight(), alignment: .bottom)

                            .background(Image(project.imageName)
                                .resizable()
                                .scaledToFill())
                                .clipShape(CustomCorner(corners: [.bottomRight], radius:getCornerRadius())
                                )
                            
                            .clipShape(CustomCorner(corners: [.bottomRight], radius:getCornerRadius()))
                            .overlay(
                                HStack(spacing: 15) {
                                                                        
                                    Image(project.logoName)
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(25)
                                        .opacity(Double(increaseOpacity(offset: offset, maxHeight: maxHeight)))
                                    
                                    Text(project.title).opacity(Double(increaseOpacity(offset: offset, maxHeight: maxHeight)))
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Text("Voltar")
                                            .frame(width: 80, height: 36)
                                            .background(Color(.black).opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                            .offset(x: 8)
                                    }
                                }
                                .padding(.horizontal)
                                .frame(height: 80)
                                .foregroundColor(.white)
                                .padding(.top, 30)
                                ,alignment: .top
                            )
                        
                    }
                    .frame(height: maxHeight)
                    .offset(y: -offset)
                    .zIndex(1)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Sobre o projeto").font(.title).bold()
                            .padding(.top, 12)
                        Text(project.description)
                            .font(.title3).fontWeight(.regular).lineSpacing(6)
                            .lineSpacing(3)
                            .foregroundColor(.primary.opacity(0.7))
                            
                    }.padding(.horizontal)
                }
                .modifier(OffsetModifier(offset: $offset))
                
            }
            // Hide the navbar in DetailView
            .navigationBarTitle("")
            .navigationBarHidden(self.navBarHidden)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                self.navBarHidden = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.navBarHidden = false
            }
            .ignoresSafeArea(.all, edges: .top)
            .coordinateSpace(name: "SCROLL")
        }.ignoresSafeArea()
    }
    

    func getHeaderHeight() -> CGFloat{
        let topHeight = maxHeight + offset
        return topHeight > (80 + 20) ? topHeight: (80 + 20)
    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + 20))
        
        let value = 1 - progress
        
        let radius = value * 50
        
        return offset < 0 ? radius : 50
    }
    
}


struct TopBarView: View {
    
    var project: Project
    var maxHeight: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(8)]), startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Image(project.logoName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                Text(project.title.uppercased()).font(.largeTitle).bold()
                Text(project.description)
                    .fontWeight(.regular)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .padding(.bottom)
            .opacity(Double(reduceOpacity(offset: offset)))
        }
    }
}

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{proxy -> Color in
                    
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                }
                ,alignment: .top
            )
    }
}


func reduceOpacity(offset: CGFloat)-> CGFloat {
    
    let progress = -offset / 90
    
    let opacity = 1 - progress
    
    return offset < 0 ? opacity: 1
}

func increaseOpacity(offset: CGFloat, maxHeight: CGFloat) -> CGFloat {
    let progress = -(offset + 70) / (maxHeight - (80 + 20))
    
    return progress
}



// PREVIEW
struct ProjectsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsDetailView(project: Projects.startupProjects.first!)
    }
}
