//
//  AddFoodView.swift
//  Prateleira-APP
//
//

import SwiftUI
struct AddFoodView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var data = Date()
    @State private var showDatePicker = false
    
    
    @State private var nome = ""
    @State private var receita = ""
    @State private var instrucao = ""
    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Nome da receita", text: $nome)
                    TextField("Ingredientes", text: $receita)
                    TextField("Instrucao", text: $instrucao)
                    
                }
                
              
                    
                    Section{
                        Button("Save"){
//                            let newFood = Hist(context:  moc)
//                            newFood.id = UUID()
//                            newFood.nome = nome
//                            newFood.data = Date.now
//                            newFood.ttl = Date.now.addingTimeInterval(30 * 24 * 60 * 60)
//                            try? moc.save()
//                            dismiss()
                        }
                    }
                }.navigationTitle("Add Book")
            }
        }
    }

#Preview {
    AddFoodView()
}
