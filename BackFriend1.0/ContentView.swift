//
//  ContentView.swift
//  BackFriend1.0
//
//  Created by Student18 on 07/06/23.
//

import SwiftUI
struct globalvars{
    static var timertotal = 0
    static var beepcount = 0
    static var timeworn = 0
    static var timetobeep = 20
    static var timewoutbeeps = 0
    static var timewoutbeepsDouble = 0.0
    static var progress1 = 0.0
    static var progress2 = 0.0
    static var progress3 = 0.0
    static var pro1 = 0.0
}

struct ContentView: View {
    @StateObject var a = ViewModel()
    @State private var loop: Bool = true
   

        init() {

            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color("base"))
            
        }
    
    var body: some View {
        VStack {
            Text("\(a.infoAx)")
                .font(.largeTitle)
                .foregroundColor(.black)
            Text("\(globalvars.timertotal)")
            
            
            TabView {
                Home()
                    .tabItem {
                        Label ("Home", systemImage: "homekit")
                    }
                    
                
                Stats()
                    .tabItem {
                        Label ("Estatísticas", systemImage: "align.vertical.bottom.fill")
                    }
                
                Achivments()
                    .tabItem {
                        Label ("Conquistas", systemImage: "star.circle.fill")
                    }
                
                Configs()
                    .tabItem {
                        Label ("Configurações", systemImage: "gearshape")
                    }
            }
        }.onAppear(){
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
                globalvars.timewoutbeepsDouble += 1
                globalvars.timewoutbeeps += 1
                globalvars.timeworn += 1
                globalvars.timertotal += 1
                if(globalvars.timertotal>=globalvars.timetobeep){
                    globalvars.beepcount += 1
                    globalvars.timertotal=0
                    globalvars.timewoutbeeps = 0
                }
             //   if(globalvars.timewoutbeeps>30){
             //       globalvars.progress1=0.5
             //   }
             //   if(globalvars.timewoutbeeps>60){
             //       globalvars.progress1=1
             //   }
            
                
                globalvars.progress1 = globalvars.timewoutbeepsDouble / 60.0
                if (globalvars.progress1 <= 1) {
                    globalvars.pro1 = globalvars.progress1
                }
                if (globalvars.progress1 > 1) {
                    globalvars.pro1 = 1.0
                }
                
                
                
                if(globalvars.timewoutbeeps>90){
                    globalvars.progress2=0.5
                }
                if(globalvars.timewoutbeeps>120){
                    globalvars.progress2=1
                }
                if(globalvars.timewoutbeeps>150){
                    globalvars.progress3=0.5
                }
                if(globalvars.timewoutbeeps>180){
                    globalvars.progress3=1
                }
                
            }
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                a.fetch()
                if(a.infoAx>=0.8){
                    globalvars.timertotal=0
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
