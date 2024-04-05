//
//  TelaExplicacaoDois.swift
//  Prateleira-APP
//
//

import SwiftUI

struct TelaExplicacaoDois: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.corFundo.ignoresSafeArea()
                VStack(alignment: .center, spacing:34){
                    Image(systemName: "carrot.fill")
                        .font(.system(size: 120))
                        .foregroundColor(.corTextoInicial)
                    VStack(alignment: .leading, spacing:23){
                        Text("Temos um check-list, onde você pode listar os alimentos que tem em sua dispensa e escolher apenas aqueles que deseja para sua receita.")
                            .foregroundStyle(.corTextoInicial)
                        
                        VStack(alignment: .leading, spacing:16 ){
                            Text("Por exemplo:")
                                .foregroundStyle(.corTextoInicial)
                            VStack(alignment: .leading, spacing: 15){
                                HStack(spacing: 5){
                                    Image(systemName: "square")
                                        .foregroundColor(.corTextoInicial)
                                    Text("Tofu")
                                        .foregroundStyle(.corTextoInicial)
                                }
                                HStack(spacing: 5){
                                    Image(systemName: "checkmark.square")
                                        .foregroundColor(.corTextoInicial)
                                    Text("Arroz")
                                    .foregroundStyle(.corTextoInicial)}
                                
                            }
                        }
                        
                    }
                    HStack{
                        NavigationLink{
                            TelaExplicacaoHist()
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

//}
#Preview {
    TelaExplicacaoDois()
}
