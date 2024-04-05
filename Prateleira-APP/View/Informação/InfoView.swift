//
//  InfoView.swift
//  Prateleira-APP
//
//

import SwiftUI

struct InfoView: View {
    
    
    @State var infs: [InfoCom] = [InfoCom(image: "guia", title: "Guia Alimentar para a População Brasileira ", link: "https://www.fsp.usp.br/nupens/o-que-e-o-guia-alimentar/"), InfoCom(image: "Mapa", title: "Mapa da água: como garantir uma água limpa para beber? ", link: "https://portrasdoalimento.info/2023/02/09/mapa-da-agua-como-garantir-uma-agua-limpa-para-beber/")]
    
    
    
    
    var body: some View {
        VStack{
            Text("Informativos")
                .font(.title)
                .padding([.top])
                .padding([.trailing], 200)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(infs) { inf in
                        InformativosComponent(inf: inf)
                        
                    }
                }
                }
                Spacer().frame(height: 20)
                Text("Conversões de medidas")
                    .font(.title2)
                    .padding([.trailing], 130)
                Spacer().frame(height: 20)
                
                ScrollView{
                    VStack{
                        Text("Volume")
                            .frame(width: 350)
                            .background(Color.cinza)
                            .foregroundColor(.black)
                        Spacer().frame(height: 15)
                        VStack(alignment:.leading){
                            Text("1 colher de sopa ≈ 15ml")
                                .font(.subheadline)
                            Spacer().frame(height: 10)
                            Text("1 colher de chá ≈ 5ml")
                                .font(.subheadline)
                            Spacer().frame(height: 10)
                            Text("1 colher de chá ≈ 5ml\n1 xícara/copo americano ≈ 240ml\nPeso\n1 xícara de farinha de trigo ≈ 120 g\n1 xícara de açúcar ≈ 200 g\n1 xícara de manteiga ≈ 225 g\nPeso e volume\n1 grama (g) de líquido ≈ 1ml\n1 grama (g) de líquido ≈ 1ml\n1 colher sopa açúcar ≈ 12,5g\n1 colher sopa farinha de trigo ≈ 7,5g\n1 colher sopa manteiga ≈ 14g\n")
                                .font(.subheadline)
                            Spacer().frame(height: 10)
                        }.padding([.top])
                            .padding([.trailing], 100)
                        
                        VStack{
                            Text("Peso")
                                .frame(width: 350)
                                .background(Color.cinza)
                                .foregroundColor(.black)
                            Spacer().frame(height: 15)
                            
                            VStack(alignment:.leading){
                                Text("1 xícara de farinha de trigo ≈ 120 g")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                                Text("1 xícara de açúcar ≈ 200 g")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                                Text("1 xícara de manteiga ≈ 225 g")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                                
                            }
                            .padding([.trailing], 100)
                        }.padding([.top])
                        
                        
                        VStack(alignment:.leading){
                            Text("Peso e volume")
                                .frame(width: 350)
                                .background(Color.cinza)
                                .foregroundColor(.black)
                            Spacer().frame(height: 15)
                            VStack(alignment:.leading){
                                Text("1 grama (g) de líquido ≈ 1ml")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                                Text("1 colher sopa açúcar ≈ 12,5g")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                                Text("1 colher sopa farinha de trigo ≈ 7,5g")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                                Text("1 colher sopa manteiga ≈ 14g")
                                    .font(.subheadline)
                                Spacer().frame(height: 10)
                            }
                        }.padding([.top])
                        
                        
                        
                        
                    }
                }.padding([.trailing], 8)
            }
        }
    }

#Preview {
    InfoView()
}
