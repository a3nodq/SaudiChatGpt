//
//  ContentView.swift
//  ChatGPT-Hackathon
//
//  Created by Farah Ashraf on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    @State var listItems = ["Graphics","Design","Fashion","Visual","Concept","Art","Advertising","Web Design","Photography"]
    @State var selectedIndex = 0
    @State var isScrolling = false
    @State var didTap = false
    
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .center) {
                    Spacer()
                    Text("Tell us more about your industry")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.trailing, 100.0)
                    
                    Spacer()
                        
                    ZStack {
                        Text("Marketing")
                            .font(.title)
                            .fontWeight(.bold)
                        Circle()
                        .strokeBorder(.black, lineWidth: 1)
                        .frame(width: 200.0, height: 200.0)
                    }

                    Spacer()
                   
                            ScrollView(.horizontal, showsIndicators: false) {

                                LazyHStack{
                                    ForEach(0..<listItems.count, id: \.self){ item in
                                        WordItem(isSelected: selectedIndex==item, label: listItems[item])
                                            .simultaneousGesture(
                                                TapGesture()
                                                    .onEnded({ _ in
                                                        selectedIndex = item
                                                    })
                                            )
                                            .onAppear(){
                                                self.isScrolling.toggle()
                                            }
                                            .offset(x: isScrolling ? -230 : 20)
                                            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: true), value: isScrolling)


                                    }

                                }
                            }
                            .frame(height: 50.0)
                    ForEach(0..<5){ index in
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack{
                                ForEach(0..<listItems.count, id: \.self){ item in
                                    WordItem(isSelected: selectedIndex==item, label: listItems[item])
                                        .simultaneousGesture(
                                            TapGesture()
                                                .onEnded({ _ in
                                                    selectedIndex = item
                                                })
                                        )
                                        
                                        .offset(x: isScrolling ? -230 : 20)
                                        .animation(Animation.linear(duration: Double(index+4)).repeatForever(autoreverses: true), value: isScrolling)
                                    
                                    
                                    
                                }
                                
                            }
                            
                            
                            
                            
                            
                        }
                        .frame(height: 50.0)
                    }
                    Spacer()
                }
                
                ZStack {
                    Circle()
                        .frame(width: 60.0, height: 60.0)
                    .padding(.trailing)
                    
                    Circle()
                        
                        .strokeBorder(.white, lineWidth: 4)
                        .frame(width: 45.0, height: 45.0)
                        .padding(.trailing)
                   
                    NavigationLink {
                        MainView()
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.trailing)
                            .frame(width: 7.45, height: 12.9)
                            .foregroundColor(.white)
                    }

                }
            }
        }
        
    }
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
