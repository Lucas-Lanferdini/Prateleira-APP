//
//  TelaExplicacaoUm.swift
//  Prateleira-APP
//
//  Created by Rafaela Laura Ribeiro on 20/11/23.
//

import SwiftUI

struct RestricaoAlimentar: Identifiable {
    var id = UUID()
    var nomeRestricao: String
}

struct TempoCozinhar: Identifiable {
    var id = UUID()
    var tempoReceita: String
}

struct BotoesRestricoes: View {
    var restricao: RestricaoAlimentar
    
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.corFundo)
                    .stroke(Color.corSelect, lineWidth:  1.0)
                    .frame(width: UIScreen.main.bounds.width*0.282, height: 30)
                // 343 -> 60
                Text(restricao.nomeRestricao)
                    .foregroundStyle(.corSelect)
                    .frame(width: UIScreen.main.bounds.width*0.282, height:40)
                    .font(.caption)
                    .bold()
            }
        }
    }
}
struct TempoReceitasView: View {
    var tempo: TempoCozinhar
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.corFundo)
                    .stroke(Color.corSelect, lineWidth:  1.0)
                    .frame(width: UIScreen.main.bounds.width*0.282, height: 30)
                // 343 -> 60
                Text(tempo.tempoReceita)
                    .foregroundStyle(.corSelect)
                    .frame(width: UIScreen.main.bounds.width*0.282, height:40)
                    .font(.caption)
                    .bold()
            }
        }
    }
}
//0.282

struct TelaExplicacaoUm: View {
    @State var restricoesLista: [RestricaoAlimentar] = [RestricaoAlimentar(nomeRestricao: "Vegetarianismo"), RestricaoAlimentar(nomeRestricao: "Glúten"), RestricaoAlimentar(nomeRestricao: "Carne Vermelha"),RestricaoAlimentar(nomeRestricao: "Veganismo"), RestricaoAlimentar(nomeRestricao:"Lactose"), RestricaoAlimentar(nomeRestricao: "Frutos do Mar")]
    
    @State  var tempoReceitasLista: [TempoCozinhar] = [TempoCozinhar(tempoReceita: "10 min"), TempoCozinhar(tempoReceita: "20 min"), TempoCozinhar(tempoReceita: "30 min"), TempoCozinhar(tempoReceita: "40 min"), TempoCozinhar(tempoReceita: "50 min"), TempoCozinhar(tempoReceita: "1 hora")]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let columns2 = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.corFundo.ignoresSafeArea()
                VStack(alignment: .center, spacing: 15){
                    Text("Inicialmente você verá alguns filtros, para que sua receita se adapte a sua alimentação")
                        .foregroundStyle(.corTextoInicial)
                        .frame(maxWidth: 350)
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(restricoesLista) { restricoes in
                            BotoesRestricoes(restricao: restricoes)
                        }
                    }
                    
                    .padding()
                    Text("Além disso, tem a opção de marcar o tempo que deseja gastar na cozinha, afinal, sabemos que seu tempo é precioso :)")
                        .foregroundStyle(.corTextoInicial)
                        .frame(maxWidth: 350)
                    LazyVGrid(columns: columns2, spacing: 0) {
                        ForEach(tempoReceitasLista) { tempos in TempoReceitasView(tempo: tempos)
                        }
                    }
                    .padding()
                    HStack{
                        NavigationLink{
                            TelaExplicacaoDois()
                        }label:{
                            ZStack{
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.corSelect)
                                    .stroke(Color.corSelect, lineWidth:  1.0)
                                    .frame(width: UIScreen.main.bounds.width*0.282, height: 30)
                                Text("Continuar")
                                    .foregroundStyle(.corFundo)
                                
                            }
                            .background(Color.corTextoInicial)
                            .clipShape(RoundedRectangle(cornerRadius: 64))
                        }}
                }
            }
        }
        .accentColor(.corTextoInicial)
    }
}
#Preview {
    TelaExplicacaoUm()
}
