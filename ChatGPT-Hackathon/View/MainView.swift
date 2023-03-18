//
//  MainView.swift
//  ChatGPT-Hackathon
//
//  Created by Farah Ashraf on 18/03/2023.
//

import SwiftUI

struct MainView: View {
   
    var body: some View {
        
        VStack{
            Text("What's Up!")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top)
            Image("Dodi")
                .resizable()
                .frame(width: 103.0, height: 103.0)
            
            Text("Don't Worry")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                
            Text("I'll take care of all the thinking")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
            HStack{
                Text("Previous Conversations")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .frame(height: 75.0)
                    .padding([.leading, .trailing])
                    .overlay(Text("Give solution Architecture for this document based on the “Design phase 3” project. ")
                        .padding(.horizontal)
                    )
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(height: 75.0)
                .padding([.leading, .trailing])
                .overlay(Text("Give me information architecture for this document.")
                    .padding(.trailing, 30.0)
                )
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 33.5)
                    .strokeBorder(Color(#colorLiteral(red: 0.2117647059, green: 0.6823529412, blue: 0.4862745098, alpha: 1)), lineWidth: 3)
                    
                    .frame(width: 316.0, height: 70.0)
                    
                    
  
                
                RoundedRectangle(cornerRadius: 33.5)
                    .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.6823529412, blue: 0.4862745098, alpha: 1)))
                    .frame(width: 286.0, height: 45.0)
                    
               
                NavigationLink {
                    ChatView()
                } label: {
                    
                    HStack {
                        Text("Start New Chat")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.trailing)
                            .frame(width: 7.45, height: 12.9)
                        .foregroundColor(.white)
                    }
                }

            }
                
            
        }.navigationBarBackButtonHidden(true)
        .background(Color(#colorLiteral(red: 0.9568627451, green: 0.9529411765, blue: 0.9529411765, alpha: 1)))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
