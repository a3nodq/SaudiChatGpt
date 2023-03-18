//
//  WordItem.swift
//  ChatGPT-Hackathon
//
//  Created by Farah Ashraf on 17/03/2023.
//

import SwiftUI

struct WordItem: View {
    @State var isSelected: Bool
    @State var label: String
    @State var Colors = [Color(#colorLiteral(red: 0.9215686275, green: 0.3254901961, blue: 0.3254901961, alpha: 1)),Color(#colorLiteral(red: 0.2117647059, green: 0.6823529412, blue: 0.4862745098, alpha: 1)),Color(#colorLiteral(red: 0.9647058824, green: 0.7882352941, blue: 0.05490196078, alpha: 1)),Color(#colorLiteral(red: 0.3019607843, green: 0.5882352941, blue: 1, alpha: 1))]
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Text(label)
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity)
            .frame(height: 50.0)
            .padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 12)
                .foregroundColor(
                    isSelected ?
                    Colors.randomElement()
                    : Color(#colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 0.3)))
            )
        }


    }
}


struct WordItem_Previews: PreviewProvider {
    static var previews: some View {
        WordItem(isSelected: false, label: "Graphics")
    }
}
