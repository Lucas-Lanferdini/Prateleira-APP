//
//  TelaUmPrateleira.swift
//  Prateleira-APP
//
//

import SwiftUI

struct TelaUmPrateleira: View {
    var body: some View {
        NavigationStack{
            ZStack {
                
                Color.corFundo.ignoresSafeArea()
                VStack(alignment: .center, spacing: 30){
                    Text("Olá, Seja Bem-Vindo(a) à")
                        .foregroundStyle(.corTextoInicial)
                    HStack(spacing: 5){
                        Text("Prateleira")
                            .foregroundStyle(.corTextoInicial)
                            .font(.system(size: 55))
                        Image(systemName: "refrigerator.fill")
                            .foregroundColor(.corLogo)
                            .font(.system(size: 50))
                    }
                    VStack(alignment: .center, spacing:45){
                        Text("Nosso objetivo é ajudar você a gerar receitas com o que tem em casa!")
                            .foregroundStyle(.corTextoInicial)
                        
                        HStack{
                            NavigationLink{
                                TelaExplicacaoUm()
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
                                
                            }
                        }
                    }
                    
                    
                }
                .padding()
                .background(Color.corFundo)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }
        }
        .accentColor(.corTextoInicial)
    }
}
#Preview {
    TelaUmPrateleira()
}
