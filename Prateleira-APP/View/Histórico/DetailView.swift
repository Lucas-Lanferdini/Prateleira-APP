//
//  DetailView.swift
//  Prateleira-APP
//
//

import SwiftUI
import TipKit



struct ParameterRuleTipHist: Tip {
    // Define the app state you want to track.
    @Parameter
    static var isLoggedInHist: Bool = false
    
    var title: Text {
        Text("Conversões de medidas")
    }
    var message: Text? {
        Text("\nVolume:\n1 colher de sopa ≈ 15ml\n1 colher de chá ≈ 5ml\n1 xícara/copo americano ≈ 240ml\n\nPeso:\n1 xícara de farinha de trigo ≈ 120 g\n1 xícara de açúcar ≈ 200 g\n1 xícara de manteiga ≈ 225 g\n\nPeso e volume:\n1 grama (g) de líquido ≈ 1ml\n1 grama (g) de líquido ≈ 1ml\n1 colher sopa açúcar ≈ 12,5g\n1 colher sopa farinha de trigo ≈ 7,5g\n1 colher sopa manteiga ≈ 14g\n")

    }
    var image: Image? {
        Image(systemName: "")
    }
    var rules: [Rule] {
        [
            // Define a rule based on the app state.
            #Rule(Self.$isLoggedInHist) {
                // Set the conditions for when the tip displays.
                $0 == true
            }
        ]
    }
}

struct IngrediantesList: View{

    let receita: String
    var body: some View {
        if receita != ""{
            Text("\(Image(systemName: "arrow.right")) \(receita)")
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                .tint(Color.red)
        }
        
        
        
        
        
    }
    
}


struct DetailView: View {
    
    let food: Hist
    var tip = ParameterRuleTipHist()

    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false


    
    
    
    var body: some View {
        TipView(tip)

       
        
        
        ScrollView{
            HStack{
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text(food.nome ?? "Receita")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Ingredientes:")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    ForEach(food.receita ?? [""], id: \.self) { ingredient in
                        Text("\(ingredient)")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    
//                            Text("Modo de Preparo:")
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
                    
                    VStack(alignment: .leading){
                        Text(food.instrucao ?? "Instrucao")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding([.top], 50)
            
            
            
            
            
            
        }.navigationTitle("Receita")
            .navigationBarBackButtonHidden(true)

            .navigationBarTitleDisplayMode(.inline)
            .alert("Deletar receita?", isPresented: $showingDeleteAlert) {
                Button("Deletar", role: .destructive, action: deleteBook)
                Button("Cancelar", role: .cancel) {}
            } message: {
                Text("Você tem certeza?")
            }
            .overlay(alignment: .top, content: {
                Color("CorFundo")
                    .background(.regularMaterial)
                    .ignoresSafeArea()
                    .frame(height: 0)
            })

            .toolbar {
                Button{
                    showingDeleteAlert = true
                } label: {
                    Label("Delete this recipe", systemImage: "trash")
                }
            }.tint(.white)
            .toolbar {
                Button{
                    ParameterRuleTipHist.isLoggedInHist.toggle()
                } label: {
                    Label("Info this recipe", systemImage: "info.circle")
                    
                }.tint(.white)

            }
            .toolbar {
                
                // 2
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        // 3
                        dismiss()
                        
                    } label: {
                        // 4
                        HStack {
                            
                            Image(systemName: "arrow.backward")
                        }.tint(.white)
                    }
                }
            }
    }
    func deleteBook() {
        moc.delete(food)
        //
        try? moc.save()
        dismiss()

    }
    
}




