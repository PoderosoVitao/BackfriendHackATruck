//
//  Configs.swift
//  BackFriend1.0
//
//  Created by Student18 on 07/06/23.
//

import SwiftUI

struct Configs: View {
    
    @State private var angulo: Double = 1.0
    @State private var modo: Bool = true
    @State private var modoNome: String = "Casual"
    @State private var volume = 50.0
    @State private var isEditing = false
    @State private var colorScheme = false
    @State private var teste: Int = 0
   
    
    var body: some View {
            
            VStack {
                Spacer()
                    .frame(height: 70)
                VStack{
                    /*  Text ("Back Friend")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("base"))
                        .padding(.bottom) */
                    
                    
                    
                    Text("Configurações")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("base"))
                }
                
                Spacer()
                
                Button(action: {
                    angulo = 0.0
                } ) {
                    Text("Redefinir Ponto 0")
                }.padding([.top, .bottom, .trailing, .leading], 10.0)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("base")))
                    .foregroundColor(Color("bgcolor"))
                    .shadow(radius: 20)
                
                
                Spacer()
                
                VStack {
                
                Text("Mudança de Modo")
                    .font(.headline)
                    .foregroundColor(Color("base"))
                
               Spacer()
                    .frame(height: 20)
                
                Button(action: {
                    if (modo == true)//mudar de casual para esporte
                    {
                        modo = false
                        modoNome = "Esporte"
                        globalvars.timetobeep = 40
                    }
                    else if (modo == false)//mudar de esporte para casual
                    {
                        modo = true
                        modoNome = "Casual"
                        globalvars.timetobeep = 20
                    }
                } ) {
                    Text("Mudar")
                }.padding([.top, .bottom, .trailing, .leading], 10.0)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("base")))
                    .foregroundColor(Color("bgcolor"))
                    .shadow(radius: 20)
                    
                Spacer()
                    .frame(height: 20)

                    
                Text("Modo atual: \(modoNome)")
                        .foregroundColor(Color("base"))
                
                    
                }
                Spacer()
                
                VStack {
                    Text("Mudar Cor")
                        .font(.headline)
                        .foregroundColor(Color("base"))
                    Toggle(isOn: $colorScheme){}
                           .padding(.trailing, 170)
                    if colorScheme {
                                    Spacer()
                            .frame(height: 0)
                            .preferredColorScheme(colorScheme ? .dark : .light)
                    
                                }
                    
                    Spacer()
                        .frame(height: 120)
                }
                
               
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("bgcolor"), Color("gradiente")]), startPoint: .top, endPoint: .bottom)
            )
            .edgesIgnoringSafeArea(.all)
    }
}

struct Configs_Previews: PreviewProvider {
    static var previews: some View {
        Configs()
    }
}
