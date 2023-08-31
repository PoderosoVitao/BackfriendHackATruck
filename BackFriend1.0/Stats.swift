//
//  Stats.swift
//  BackFriend1.0
//
//  Created by Student18 on 07/06/23.
//

import SwiftUI

class Estatistica: Identifiable{
    var id: Int
    var name: String
    var dado: Int
    
    init(id: Int, name: String, dado: Int) {
            self.id = id
            self.name = name
            self.dado = dado
        }
}

struct Stats: View {
    
    let arrayEstatistica = [
        Estatistica(id: 1, name: "Amount of Beeps", dado: globalvars.beepcount),
        Estatistica(id: 3, name: "Time Worn", dado: globalvars.timeworn),
        Estatistica(id: 4, name: "Time Without Beeps", dado: globalvars.timewoutbeeps)
    ]
    
    var body: some View {

            VStack {
                Spacer()
                
                
                
                /* Text ("Back Friend")
                 .font(.largeTitle)
                 .fontWeight(.bold)
                 .foregroundColor(Color("base"))
                 .padding(.bottom) */
                
                
                
                Text("Estatísticas de Uso")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("base"))
                
                //  Spacer()
                
                
                
                ScrollView{
                    ForEach(arrayEstatistica){Estatistica in
                        HStack{
                            Text(Estatistica.name + ":")
                                .foregroundColor(Color("preto"))
                            
                            Text(String(Estatistica.dado))
                                .font(.title3)
                                .foregroundColor(Color("preto"))
                            if(Estatistica.id==3 || Estatistica.id==4){
                                Text("Segundos")
                            }
                        }
                        .padding(.all)
                        .frame(width: 360, height: 50.0, alignment: .topLeading)
                        Spacer()
                        
                        
                    }
                    
                    Spacer()
                }
                .frame(width: 360.0, height: 225.0)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("base")))
                .shadow(radius: 20)
                
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }.padding(20.0)
            .background(LinearGradient(gradient: Gradient(colors: [Color("bgcolor"), Color("gradiente")]), startPoint: .top, endPoint: .bottom)
            )
            .edgesIgnoringSafeArea(.all)
        }
        
        
        //.foregroundColor(Color("bgcolor"))
    }

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
