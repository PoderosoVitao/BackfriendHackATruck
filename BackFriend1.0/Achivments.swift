//
//  Achivments.swift
//  BackFriend1.0
//
//  Created by Student18 on 07/06/23.
//

import SwiftUI

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    var isUnlocked: Bool = false
    var progress: Double
}


struct AchievementRow: View {
    @Binding var achievement: Achievement
    @Binding var achievements: [Achievement]
    
    
    @State var progress = 0.0
    
    var body: some View {
        ScrollView {
            VStack{
              /*  Text("Back Friend")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("base")) */
        
                Spacer()
                    //.frame(height: 30)
                
                Text("Conquistas")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("base"))
                
                ForEach(achievements) { achievement in
                    HStack {
                        Image(systemName: achievement.isUnlocked ? "checkmark.circle.fill" : "circle")
                            .padding(.leading, 9)
                            .foregroundColor(achievement.isUnlocked ? Color("verde") : .gray)
                            .font(.system(size: 24))
                        
                        VStack(alignment: .leading) {
                            Text(achievement.title)
                                .font(.headline)
                                .padding(.top,5)
                            Text(achievement.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom,5)
                        }
                        
                        Spacer()
                        
                        if achievement.isUnlocked {
                            Text("Concluído")
                                .foregroundColor(Color("verde"))
                                .font(.subheadline)
                                .padding(.trailing)
                        } else {
                            if achievement.progress >= 1.0 {
                                Button(action: {
                                    unlockAchievement(achievement)
                                }) {
                                    Text("Desbloquear")
                                        .foregroundColor(Color("bgcolor"))
                                        .font(.subheadline)
                                        .padding(.trailing)
                                }
                            } else {
                                ProgressView(value: achievement.progress)
                                    .padding(.trailing)
                                    .accentColor(Color("bgcolor"))
                                    .frame(width: 100)
                                    .progressViewStyle(LinearProgressViewStyle())
                            }
                            
                        }
                    }.background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("base")))
                        .padding(.vertical,5)
                        .padding(.horizontal,10)
                        .shadow(radius: 50)
                }
            }.onAppear(){
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ time in 
                    progress = globalvars.timewoutbeepsDouble/60.0
                    
                    
                    print(progress)
                }
            }
        }
            .background(LinearGradient(gradient: Gradient(colors: [Color("bgcolor"), Color("gradiente")]), startPoint: .top, endPoint: .bottom)
            )
    }
    
    private func unlockAchievement(_ achievement: Achievement) {
        guard let index = achievements.firstIndex(where: { $0.id == achievement.id }) else {
            return
        }
        
        achievements[index].isUnlocked = true
    }
}

struct AchievementsView: View {
    @State var achievements: [Achievement] = [
        Achievement(title: "Conquista 1", description: "1 minuto sem beepar", imageName: "achievement1", progress: globalvars.progress1),
        Achievement(title: "Conquista 2", description: "2 minutos sem beepar", imageName: "achievement2", progress: globalvars.progress2),
        Achievement(title: "Conquista 3", description: "3 minutos sem beepar", imageName: "achievement3", progress: globalvars.progress3)
    ]
    
    var body: some View {
        NavigationView {
            AchievementRow(achievement: $achievements[0], achievements: $achievements)
                //.navigationBarTitle(Text("Conquistas").foregroundColor(Color.white))
            
        }.onAppear(){
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ time in
                
                achievements =  [
                    Achievement(title: "Conquista 1", description: "1 minuto sem beepar", imageName: "achievement1", progress: globalvars.pro1),
                    Achievement(title: "Conquista 2", description: "2 minutos sem beepar", imageName: "achievement2", progress: globalvars.progress2),
                    Achievement(title: "Conquista 3", description: "3 minutos sem beepar", imageName: "achievement3", progress: globalvars.progress3)
                ]
            
            }
        }
        
    }
}

struct Achivments: View {
    var body: some View {
        AchievementsView()
    }
}

struct Achivments_Previews: PreviewProvider {
    static var previews: some View {
        Achivments()
    }
}

