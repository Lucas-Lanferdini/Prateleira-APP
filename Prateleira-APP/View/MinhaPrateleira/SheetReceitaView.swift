import SwiftUI
import OpenAIKit

struct SheetReceitaView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var resp: String = ""
    @State private var isLoading: Bool = true
    @ObservedObject var apiReq: ApiReq
    
    var body: some View {
        ScrollView{
            if isLoading {
                Spacer().frame(height: 350)
                ProgressView()
                    .frame(width: 350)
            } else {
                if let recipe = apiReq.recipe {
                    HStack{
                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                            Text(recipe.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Ingredientes:")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                Text("\(ingredient)")
                                    .font(.body)
                                    .foregroundColor(.black)
                            }
                            
//                            Text("Modo de Preparo:")
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading){
                                Text(recipe.instructions)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                    .padding([.top], 50)
                }
            }
        }
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        Task {
            do {                
               resp = try await apiReq.makeRequest(moc: moc)
//                let newFood = Hist(context:  moc)
//                newFood.id = UUID()
//                newFood.nome = resp
//                
//                newFood.data = Date.now
//                newFood.fav = false
//                newFood.ttl = Date.now.addingTimeInterval(30 * 24 * 60 * 60)
//                try? moc.save()
            } catch {
                print("Error fetching data: \(error)")
            }
            isLoading = false
        }
    }
    
}

//    #Preview {
//        SheetReceitaView(arrayFood: .constant([""]), apiReq: <#ApiReq#>)
//    }
