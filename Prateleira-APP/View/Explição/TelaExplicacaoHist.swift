//
//  TelaExplicacaoHist.swift
//  Prateleira-APP
//
//

import SwiftUI

struct TelaExplicacaoHist: View {
    
    @State var isShowingNextView: Bool = false
    @AppStorage("tutorial", store: .standard) var showTutorial: Bool = true
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                Color.corFundo.ignoresSafeArea()
                VStack(spacing: 5){
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.system(size: 100))
                        .foregroundColor(.corTextoInicial)
                    Text("Receitas geradas são salvas no seu histórico e caso você tenha gostado de alguma receita você pode favoritar ela.")
                        .foregroundStyle(.corTextoInicial)
                        .padding()
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.corTextoInicial)
                                .frame(width: 66.77, height: 65.93)
                            VStack{
                                Text("08")
                                    .font(.title)
                                    .bold()
                                VStack{
                                    Text("OUT.")
                                        .font(.caption)
                                        .bold()
                                }
                            }
                        }
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.corTextoInicial)
                                .stroke(Color.corSelect, lineWidth:  1.0)
                                .frame(width:280, height: 65.93)
                            HStack{
                                VStack(alignment:.leading){
                                    Text("Massa Carbonara")
                                        .foregroundStyle(.black)
                                        .bold()
                                    Text("200g de massa")
                                        .foregroundStyle(.corFundo)
                                        .font(.caption2)
                                    Text("3 ovos")
                                        .foregroundStyle(.corFundo)
                                        .font(.caption2)
                                    Text("100g de queijo...")
                                        .foregroundStyle(.corFundo)
                                        .font(.caption2)
                                }
                                Spacer().frame(width: 85)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.corFavoritos)
                                
                            }
                            .padding(.horizontal)
                            
                        }
                    }
                    .padding(.bottom, 2)
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.corTextoInicial)
                                .frame(width: 66.77, height: 65.93)
                            VStack{
                                Text("10")
                                    .font(.title)
                                    .bold()
                                VStack{
                                    Text("OUT.")
                                        .font(.caption)
                                        .bold()
                                }
                                
                            }
                            
                        }
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.corTextoInicial)
                                .stroke(Color.corSelect, lineWidth:  1.0)
                                .frame(width:280, height: 65.93)
                            HStack{
                                VStack(alignment:.leading){
                                    Text("Strogonoff")
                                        .foregroundStyle(.black)
                                        .bold()
                                    Text("200g de carne")
                                        .foregroundStyle(.corFundo)
                                        .font(.caption2)
                                    Text("1 creme de leite")
                                        .foregroundStyle(.corFundo)
                                        .font(.caption2)
                                    Text("100g de queijo...")
                                        .foregroundStyle(.corFundo)
                                        .font(.caption2)
                                }
                                Spacer().frame(width: 135)
                                Image(systemName: "star")
                                    .foregroundColor(.corFavoritos)
                            }
                            .padding(.horizontal)
                        }
                    }
                    //.padding(.bottom, 40)
                    
                    
                    Button(action: {
                        UserDefaults.standard.setValue(true, forKey: "tutorial")
                        showTutorial.toggle()
//                        self.isShowingNextView.toggle()
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.corSelect)
                                .stroke(Color.corSelect, lineWidth:  1.0)
                                .frame(width: UIScreen.main.bounds.width*0.282, height: 30)
                            Text("Continuar")
                                .foregroundStyle(.corFundo)
                        }
                    })
                    .background(Color.corTextoInicial)
                    .clipShape(RoundedRectangle(cornerRadius: 64))
                    .padding([.top], 30)
                    
                    

//                    NavigationLink(isActive: self.$isShowingNextView, destination: {
//                        MinhaPrateleiraView()
//                            .navigationBarBackButtonHidden(true)
//                    }, label: {
//                        EmptyView()
//                    })
                    
                    //                    NavigationLink{
                    //                        MinhaPrateleiraView()
                    //                            .navigationBarBackButtonHidden(true)
                    //                    } label:{
                    //                        ZStack{
                    //                            RoundedRectangle(cornerRadius: 16)
                    //                                .fill(Color.corSelect)
                    //                                .stroke(Color.corSelect, lineWidth:  1.0)
                    //                                .frame(width: UIScreen.main.bounds.width*0.282, height: 30)
                    //                            Text("Continuar")
                    //                                .foregroundStyle(.corFundo)
                    //                        }
                    //                    }
                    //                    .background(Color.corTextoInicial)
                    //                    .clipShape(RoundedRectangle(cornerRadius: 64))
                    //                    .padding([.top], 30)
                }
            }
        }
    }
}


//   }
//}

#Preview {
    TelaExplicacaoHist()
}
