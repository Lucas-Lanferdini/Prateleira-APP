import SwiftUI
import TipKit





struct HistComponent: View {
    
    @State var novo: String = ""
    
    // @State @ObservedObject var viewModel: Dele = Dele()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.data, order: .reverse),
        
    ]) var foods: FetchedResults<Hist>
    @State private var showingAddScreen = false
    
    let date = Date()
    
    init() {
      // Large Navigation Title
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      // Inline Navigation Title
      UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = UIColor(named: "CorFundo")
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(foods) {
                    food in
                    
                    
                    //                    if daydiff >= 30 {
                    //                        Dele(food: food).deleteBook()
                    //
                    //                    }
                    NavigationLink {
                        DetailView(food: food)
                    } label: {
                        HStack {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.corSelect)
                                    .frame(width: 50, height: 50)
                                VStack{
                                    Text(getDayFormatted(date: food.data ?? .now))
                                    Text(getMonthFormatted(date: food.data ?? .now))
                                }
                            }
                            //print(food.data)
                            //.font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(food.nome ?? "Unknown Title")
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                
                            }
                            
                            Spacer()
                            
                            Image(systemName: food.fav ? "star.fill" : "star")
                                .foregroundStyle(food.fav ? .yellow : .corSelect)
                                .font(.system(size: 12))
                            
                        }
                        
                        
                        .swipeActions(edge: .trailing, allowsFullSwipe: true, content:{
                            
                            Button(action: {
                                food.fav.toggle()
                                
                            }, label: {
                                Image(systemName: food.fav  ? "star.slash": "star")
                                    .foregroundStyle(.yellow)
                                
                            }).tint(.yellow)
                            
                        })
                        
                        
                        // }
                    }
                    
                    .onAppear {
                        // Inicie um timer para verificar e excluir objetos a cada X segundos
                        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                            deleteExpiredItems()
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                }
            }
            .padding(.top)
            .listStyle(.plain)
            .overlay(alignment: .top, content: {
                Color("CorFundo")
                    .background(.regularMaterial)
                    .ignoresSafeArea()
                    .frame(height: 0)
            })
            .navigationTitle("Histórico")
            .sheet(isPresented: $showingAddScreen){
                AddFoodView()
            }
            .toolbarBackground(.visible, for: .tabBar)
//            .toolbarBackground(Color("CorFundo"), for: .tabBar)
            
//            .toolbarBackground(.visible, for: .navigationBar)
//            .toolbarBackground(Color("CorFundo"), for: .navigationBar)
        }
        .ignoresSafeArea()
        
    }
    func deleteFood(at offsets: IndexSet) {
        for offset in offsets {
            let food = foods[offset]
            moc.delete(food)
        }
    }
    
    func getDayFormatted(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func getMonthFormatted(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    
    
    private func deleteExpiredItems() {
        withAnimation {
            foods.forEach { food in
                // Verifique a idade do objeto
                if food.fav == false{
                    if Date.now > food.ttl! {
                        moc.delete(food)
                    }
                }
            }
            
            // Salve o contexto após excluir os objetos
            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
    
}
#Preview {
    HistComponent()
}
