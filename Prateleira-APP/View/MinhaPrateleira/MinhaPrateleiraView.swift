import SwiftUI
import TipKit

struct MinhaPrateleiraView: View {
   // @StateObject private var viewModel = ToDoListViewModel()
    let restrictions = ["Vegetarianismo", "Glúten", "Carne Vermelha", "Veganismo", "Lactose", "Frutos do Mar"]
    let time = ["10 min", "20 min", "30 min", "40 min", "50 min", "1 hora"]

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [ ]) var foods: FetchedResults<Teste>
    @State private var nome: String = ""
    @State var tip = ParameterRuleTip()


    var body: some View {
        VStack {
            ZStack{
                headerView()
                    .ignoresSafeArea()

               // TipView(tip)
                       // .onDisappear(perform: tog())
                
            }

            ScrollView {
                VStack(alignment: .leading){
                    
                    Text("Você tem alguma restrição alimentar?")
                        .font(.system(size: 18.9))
              
                    RestrictionAndTimeButtonsView(buttons: restrictions)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    Spacer()
                    
                    Text("Quanto tempo tem disponível para receita?")
                        .font(.system(size: 18.9))
                    
                    RestrictionAndTimeButtonsView(buttons: time)
                        .frame(maxWidth: .infinity)
                    
                }.padding(.horizontal)
                .padding(.bottom, 20)
                
                    Spacer()
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading) {
                        Text("Sua Despensa")
                            .font(.system(size: 18.9))


                        VStack(alignment: .leading) {
                       
                            ListView()
                        }
//                        .onAppear {
//                            viewModel.addTask(task: ToDoList(id: 3, food: "Arroz Branco"))
//                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    
                    
                }
                .padding(.horizontal)
            }
            generateRecipeView()
                .frame(maxWidth: .infinity)
            Spacer()
        }
       
    }
    
    
    
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = foods[offset]
            moc.delete(book)
            try? moc.save()

        }
        
        //try? moc.save()
    }
    
    func tog() -> Void{
        ParameterRuleTip.isLoggedIn.toggle()
    }
    
}

#Preview {
    MinhaPrateleiraView()
}

