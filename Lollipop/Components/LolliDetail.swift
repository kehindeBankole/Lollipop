//
//  LolliDetail.swift
//  Lollipop
//
//  Created by Kehinde Bankole on 19/11/2024.
//

import SwiftUI


let list = ["Choc Swirl" , "Vanilla Dream", "Spicy Tart"]
let randomColors:[Color] = [.appBlue , .appBrown , .appCream , .appGreen , .appLemon]
let images = ["chocolate" , "vanilla"]

struct LolliDetail: View {
    @Binding var sheetVisible:Bool
    @State var openMenu = false
    
    @Namespace private var animationNamespace
    @State private var isExpanded = false
    
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
        
    }
    
    var body: some View {
        VStack(spacing : 10){
            ScrollView{
                
                
                HStack{
                    Text("Pick your pop").font(.semibold(size: 20))
                    Spacer()
                    Button(action:{
                        withAnimation{
                            sheetVisible = false
                        }
                    }){
                        Image(systemName: "xmark").foregroundStyle(.black)
                    }
                }
                if(isExpanded){
                    VStack(spacing : 34){
                        
                        
                        Button(action:{
                            withAnimation(.linear(duration: 0.2)){
                                isExpanded = false
                            }
                        }){
                            Image("chocolate")
                                .resizable()
                                .frame(width: 178 , height: 300)
                        }
                        
                        
                        
                        
                        VStack(spacing : 5){
                            HStack{
                                
                                Text("Caramel Swirl").font(.semibold(size: 16)).foregroundStyle(.black)
                                Spacer()
                                Text("Velvety caramel • $4.05").font(.medium(size: 14)).foregroundStyle(.black)
                                
                            }
                            
                            HStack{
                                Text("Velvety caramel in every swirl – satisfyingly smooth and sweet.").font(.regular(size: 14)).foregroundStyle(.grayThree)
                                Spacer()
                            }
                        }
                        
                        
                        Button(action:{
                            withAnimation(.linear(duration: 0.2)){
                                isExpanded = false
                            }
                        }){
                            HStack{
                                HStack{
                                    Image(systemName: "arrow.left")
                                    Text("Back to all").font(.semibold(size: 16))
                                }.foregroundStyle(.white)
                                Spacer()
                                Text("Inc. tax $2.10").font(.semibold(size: 16)).foregroundStyle(.grayFour)
                            }
                            .padding(.vertical , 16)
                            .padding(.horizontal , 24)
                            .background(RoundedRectangle(cornerRadius: 24).fill(.black))
                            .frame(maxWidth : .infinity)
                        }.frame(maxWidth : .infinity)
                        
                    }.frame(maxWidth : .infinity)
                        .matchedGeometryEffect(id: "detail", in: animationNamespace)
                        .transition(.scale)
                }else{
                    
                    
                    
                    VStack{
                        GeometryReader{reader1 in
                            ScrollView(.horizontal , showsIndicators: false) {
                                LazyHStack(spacing: 0) {
                                    ForEach(images , id: \.self) { image in
                                        GeometryReader{ reader in
                                            Button(action:{
                                                withAnimation(.linear(duration: 0.2)){
                                                    isExpanded = true
                                                }
                                            }){
                                                VStack{
                                                    
                                                    Image(image)
                                                        .resizable()
                                                        .frame(width: 100 , height: 167)
                                                        .rotationEffect(
                                                            .init(degrees: getPercentage(geo: reader) * -90)
                                                            
                                                        )
                                                    
                                                    
                                                    VStack(spacing: 5){
                                                        Text("Caramel Swirl").font(.semibold(size: 16)).foregroundStyle(.black)
                                                        Text("Velvety caramel • $4.05").font(.regular(size: 14)).foregroundStyle(.grayThree)
                                                    }
                                                } .frame(width: reader.size.width)
                                            }
                                        }.frame(width: reader1.size.width)
                                    }
                                }.scrollTargetLayout()
                            }.scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                        }.frame(height: 300)
                        
                        
                        
                        
                        
                        
                        ZStack(alignment: .topTrailing){
                            if(openMenu){
                                VStack(alignment : .leading , spacing: 14){
                                    ForEach(Array(list.enumerated()), id:\.offset){ index , item in
                                        HStack(){
                                            
                                            
                                            Image("check").font(.system(size: 14))
                                                .opacity(index == 0 ? 1 : 0)
                                            
                                            Text(item)
                                                .font(.medium(size: 14))
                                            
                                            
                                            Spacer()
                                            HStack( spacing: 8){
                                                ForEach(1...2 , id: \.self){inded in
                                                    Circle().fill(randomColors[Int.random(in: 0...4)])
                                                        .frame(width: 16, height: 16)
                                                }
                                                
                                            }
                                        }
                                        if(index != list.count - 1){
                                            Divider().background(Color.graySix)
                                        }
                                    }
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                    
                                        .fill(Color.white) // Background color
                                        .shadow(color:.offWhite, radius: 32, x: 0, y: 4)
                                    
                                )
                                .zIndex(1)
                                .offset(y : -120)
                                .frame(width: 216)
                            }
                            
                            VStack(alignment :.trailing , spacing : 24){
                                
                                
                                
                                HStack{
                                    Text("Select topping")
                                        .font(.medium(size: 16))
                                    Spacer()
                                    Button(action :{
                                        //do nothing
                                    }){
                                        HStack(spacing: 10){
                                            Text("Caramel")
                                                .font(.medium())
                                            
                                            Image(systemName: "chevron.left").rotationEffect(.degrees(-90))
                                                .font(.system(size: 10))
                                                .fontWeight(.bold)
                                        } .foregroundStyle(.grayThree)
                                    }
                                }
                                
                                
                                
                                HStack{
                                    Text("Select colour")
                                        .font(.medium(size: 16))
                                    Spacer()
                                    Button(action:{
                                        withAnimation(.linear(duration: 0.1)){
                                            openMenu = !openMenu
                                        }
                                    }){
                                        HStack( spacing: 8){
                                            ForEach(1...2 , id: \.self){ inded in
                                                Circle().fill(randomColors[Int.random(in: 0...3)])
                                                    .frame(width: 16, height: 16)
                                                
                                            }
                                            Image(systemName: "chevron.left").rotationEffect(.degrees(-90))
                                                .font(.system(size: 10))
                                                .fontWeight(.bold)
                                                .foregroundStyle(.grayThree)
                                            
                                        }
                                    }
                                }
                                
                                HStack{
                                    Text("Quantity")
                                        .font(.medium(size: 16))
                                    Spacer()
                                    HStack(spacing: 27){
                                        Button(action: {}){
                                            Image(systemName: "plus")
                                                .foregroundStyle(.black)
                                                .font(.system(size: 14))
                                        }
                                        Text("1").font(.semibold())
                                        Button(action: {}){
                                            Image(systemName: "minus")
                                                .foregroundStyle(.black)
                                                .font(.system(size: 14))
                                        }
                                    }
                                    .padding(.vertical , 8)
                                    .padding(.horizontal , 14)
                                    .background(RoundedRectangle(cornerRadius: 16).strokeBorder(.graySix , lineWidth: 1))
                                }
                                Button(action:{}){
                                    HStack{
                                        Text("Add $5.25").font(.semibold(size: 16)).foregroundStyle(.white)
                                        Spacer()
                                        Text("Inc. tax $2.10").font(.semibold(size: 16)).foregroundStyle(.grayFour)
                                    }
                                    .padding(.vertical , 16)
                                    .padding(.horizontal , 24)
                                    .background(RoundedRectangle(cornerRadius: 24).fill(.black))
                                    .frame(maxWidth : .infinity)
                                }.frame(maxWidth : .infinity)
                            }
                        }
                    }.matchedGeometryEffect(id: "detail", in: animationNamespace)
                }
                
            }
            
        }
        
    }
}

#Preview {
    LolliDetail(sheetVisible: .constant(true)).padding()
}
