//
//  ContentView.swift
//  SaudiChatGPT
//
//  Created by AlanoudApple on 25/08/1444 AH.
//

import SwiftUI



struct ChatView: View {
    
    @State private var clientmsg: String = ""
    @State private var chatmsg = [ChatRespons]()
    @StateObject var chatViewModel = ChatViewModel()
    @StateObject var voiceViewModel = VoiceViewModel()
    @State private var show: Bool = false
    @State var models = [String]()
    @State var modelsChatGPT = [String]()
    var body: some View {
         ScrollView{
             VStack{
                 
                 VStack {
                     
                     ChatBubble(direction: .left) {
                         Text(
                            "Hello I am Dodi, you have chosen Marketing industry, How may I help you?"
                         )
                         .padding()
                         .background(.white)
                         ForEach(modelsChatGPT, id: \.self) { item in
                             Text(item)
                                 .padding()
                                 .background(.white)
                             
                         }
                     }
                     
                     ChatBubble(direction: .right) {
                         ForEach(models, id: \.self) { item in
                             Text(item)
                                 .padding()
                                 .foregroundColor(Color.white)
                             .background(Color(#colorLiteral(red: 0.2471139729, green: 0.7264285684, blue: 0.5593883395, alpha: 1)))}
                     }
                 }
                 Spacer()
//                 ZStack(){
//                     Circle()
//                         .fill(Color(#colorLiteral(red: 0.3653547764, green: 0.6648816466, blue: 1, alpha: 0.8470588235)))
//                         .frame(width: 48, height: 48, alignment: .trailing)
//                 Button{
//                     print("micro")
//                 } label: {
//                     Image(systemName:"viewfinder.circle")
//                         .frame(width: 24, height: 24, alignment: .trailing)
//                 }.padding()
//
//             }
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(width: 350, height: 42)
                    HStack(alignment: .bottom){
                        TextField(
                            "How can I assist you today?",
                            text: $clientmsg
                        ).padding(.leading)
                        Button{
                            voiceViewModel.startRecording()
                        } label: {
                            Image("microphone2")
                                .frame(width: 24, height: 24, alignment: .trailing)
                        }
                        Button{
                            send()
                            
                        }
                    label: {
                        Image(systemName: "location.fill")
                        //                            .background(Color(#colorLiteral(red: 0.2471139729, green: 0.7264285684, blue: 0.5593883395, alpha: 1)))
                            .frame(width: 24, height: 24, alignment: .trailing)
                            
                    }
                        
                    }
                  
                    }
                    .background(.white)
                    .cornerRadius(12)
                    .padding()
                    
                    
                
            }
            .onAppear{
                print("Hello from onAppear()")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Chat")
        .background(Color(#colorLiteral(red: 0.9657593369, green: 0.9626023173, blue: 0.9625357985, alpha: 1)))
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("❤️")
                    
                } label: {
                    Image("Tan")
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 41, height: 41, alignment: .trailing)
                }
            }
           
            
        }
       
    }
    
    func send(){
        guard !clientmsg.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        
        models.append(clientmsg)
        chatViewModel.loadData(msg: clientmsg) { response in
                modelsChatGPT.append(response?.text ?? "")
        }
        }
        
   
        
    }

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}



struct ChatBubble<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    init(direction: ChatBubbleShape.Direction, @ViewBuilder content: @escaping () -> Content) {
            self.content = content
            self.direction = direction
    }
    
    var body: some View {
        VStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }.padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
        .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

struct ChatBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            p.addLine(to: CGPoint(x: 21, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 20),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 4, y: 8))
            p.addLine(to: CGPoint(x: 4, y: height - 11))
            p.addCurve(to: CGPoint(x: 0, y: height),
                       control1: CGPoint(x: 4, y: height - 1),
                       control2: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                       control1: CGPoint(x: 4.0, y: height + 0.5),
                       control2: CGPoint(x: 8, y: height - 1))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 16, y: height),
                       control2: CGPoint(x: 20, y: height))
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}


