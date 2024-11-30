//
//  LolliCard.swift
//  Lollipop
//
//  Created by Kehinde Bankole on 19/11/2024.
//

import SwiftUI

struct LolliCard: View {
    var body: some View {
        VStack(alignment: .center , spacing: 20){
            Image("chocolate")
            VStack(alignment: .leading , spacing: 10){
                Text("Swirly Choc")
                    .font(.semibold(size: 16))
                  
                HStack{
                    Group{
                        Text("$9.50")
                        Text("$9.50")
                            .strikethrough()
                            .foregroundStyle(Color.grayFour)
                    }.font(.regular(size: 16))
                    Spacer()
                }
        
            }
          
        }
        .frame(width: 200)
        .padding(19)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(.white)
                .strokeBorder(.offWhite, lineWidth: 1)
        )
    }
}

#Preview {
    LolliCard()
}
