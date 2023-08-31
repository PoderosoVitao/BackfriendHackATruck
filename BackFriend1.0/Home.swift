//
//  Home.swift
//  BackFriend1.0
//
//  Created by Student18 on 07/06/23.
//

import SwiftUI

struct Home: View {
    
    @State private var bateria: Int = 90
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                
                // Text ("Back Friend")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("base"))
                
                
                
                Spacer()
                
                
                   VStack {
                 if (bateria == 0) {
                 Label ("", systemImage: "battery.0")
                 .foregroundColor(Color("vermelho"))
                 .font(.system(size: 60))
                 }
                 
                 if (bateria > 0 && bateria < 25) {
                 Label ("", systemImage: "battery.0")
                 .foregroundColor(Color("base"))
                 .font(.system(size: 60))
                 }
                 if (bateria >= 25 && bateria < 50) {
                 
                 Label ("", systemImage: "battery.25")
                 .foregroundColor(Color("base"))
                 .font(.system(size: 60))
                 }
                 
                 if (bateria >= 50 && bateria < 75) {
                 Label ("", systemImage: "battery.50")
                 .foregroundColor(Color("base"))
                 .font(.system(size: 60))
                 }
                 
                 if (bateria >= 75 && bateria < 100) {
                 Label ("", systemImage: "battery.75")
                 .foregroundColor(Color("base"))
                 .font(.system(size: 60))
                 }
                 
                 if (bateria == 100) {
                 Label ("", systemImage: "battery.100")
                 .foregroundColor(Color("verde"))
                 .font(.system(size: 60))
                 }
                 }//.padding(.leading, 30)
                 
                 Text("\(bateria)%")
                 .font(.title)
                 .foregroundColor(Color("base"))
                 // .padding(.leading, 20)
                 .padding(.top, 5)
                 
                
                
                
                Spacer()
                
                AsyncImage(url: URL(string: "https://d229kd5ey79jzj.cloudfront.net/974/images/974_1_H.png")) { capa in
                    capa.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 400, height: 400)
                .shadow(radius: 20)
                
                Spacer()
                Spacer()
                
            }.background(LinearGradient(gradient: Gradient(colors: [Color("bgcolor"), Color("gradiente")]), startPoint: UnitPoint(x: 0.5, y: 0.5), endPoint: UnitPoint(x: geometry.frame(in: . local).maxX / geometry.size.width, y: geometry.frame(in: . local).maxY / geometry.size.height))
            )
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
