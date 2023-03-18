//
//  ChatViewModel.swift
//  SaudiChatGPT
//
//  Created by AlanoudApple on 25/08/1444 AH.

import Foundation

class ChatViewModel: ObservableObject{
    
    
    
    @Published var chat = [Chat]()
    @Published private var msg: String = ""
   // @Published var chatGptresponse = [ChatRespons]()
     var chatGptresponse = [ChatRespons]()
    
    func loadData(msg:String, complete: @escaping (ChatRespons?) -> Void){
//    completion: @escaping (String) -> Void
     
        let parameters = "{\n    \"model\": \"text-davinci-003\",\n    \"prompt\": \"\(msg)\",\n    \"max_tokens\": 2000,\n    \"temperature\": 0\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://experimental.willow.vectara.io/v1/completions")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("xxx", forHTTPHeaderField: "customer-id")
        request.addValue("xxxx", forHTTPHeaderField: "x-api-key")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let response =   try?  JSONDecoder().decode(Chat.self, from: data)
            var chiceText = (response?.choices[0].text)!
           //print(chiceText)
            let chat = ChatRespons(text: chiceText)
            //self.chatGptresponse.append(ChatRespons(text: chiceText))
            complete(chat)
            
//            print(chatGptresponse)
        }
        
        task.resume()
        
    }
    
//    func chatGptresponse() -> String{
//
//    }
   
    
    
}

struct ChatRespons{
    var text: String
}

   


 
    
    //    func setup(){
    //        client = OpenAISwift(authToken: "zqt_4VIH6IbV6dZCMU69ac9aPZsMB4jZks0-ghfnUw")
    //        print("here setup function🥛")
    //    }
    //
    //    func sending(text:String,
    //                 completion: @escaping (String) -> Void){
    //        client?.sendCompletion(with: text, maxTokens: 500,
    //        completionHandler: { result in
    //            switch result{
    //            case.success(let model):
    //                let output = model.choices.first?.text ?? ""
    //                completion(output)
    //            case.failure:
    //                break
    //            }
    //        })
    //
    //    }
//    func loadData(msg:String,completion: @escaping (String) -> Void) {
//        guard let url = URL(string: "https://experimental.willow.vectara.io/v1/completions") else {
//            print("Your API end point is Invalid👍🏻")
//            return
//        }
//
//        var request = URLRequest(url:url)
//        request.httpMethod = "POST"
////        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
////        request.setValue("*/*", forHTTPHeaderField: "Accept")
////        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
////        request.setValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
//        request.setValue("3780249576", forHTTPHeaderField: "customer-id")
//        request.setValue("zqt_4VIH6IbV6dZCMU69ac9aPZsMB4jZks0-ghfnUw", forHTTPHeaderField: "x-api-key")
//        print(url.baseURL)
//        let body :[String: AnyHashable] = [
//            "model": "text-davinci-003",
//            "prompt": msg,
//            "max_tokens": 300,
//            "temperature": 0
//        ]
//        let task = URLSession.shared.dataTask(with: request){
//                   data,_,error in
//            guard let data = data,error == nil else{
//                       return
//                   }
//            let response = try? JSONDecoder().decode(Chat.self, from: data)
//            do{
//                let result = try? response?.choices[0].text
//                print(result)
//            }
////
////        request.httpBody = try? JSONSerialization.data(withJSONObject: body,options: .fragmentsAllowed)
////        let task = URLSession.shared.dataTask(with: request){
////            data,_,error in guard let data = data,error == nil else{
////                return
////            }
////            do{
////                let resopnse = try JSONSerialization.jsonObject(with: data,options: .allowFragments)
////                print(resopnse)
////            }
////            catch{
////                print(error)
////            }
//
//        }
//        task.resume()
//    }
//}
//
//
////        let request = URLRequest(url: url)
////
////        URLSession.shared.dataTask(with: request) { data, response, error in
////            if let data = data {
////
////                if let response = try? JSONDecoder().decode([Message].self, from: data) {
////
////                    DispatchQueue.main.async {
////                        self.messeges = response
////                    }
////
////                    return
////                }
////
////        }
////
////        }.resume()
////    }
////
////}
