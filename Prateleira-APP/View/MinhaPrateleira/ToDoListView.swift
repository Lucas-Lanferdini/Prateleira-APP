import Foundation
import SwiftUI

struct ListView: View {
    //@ObservedObject var viewModel: ToDoListViewModel
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var foods: FetchedResults<Teste>
    @State private var new: String = ""
    @State private var nome: String = ""
    
    // @FocusState private var focusedField: Int?
    //    @Binding var list: ToDoList
    
    var body: some View {
        //        Image(systemName: viewModel.list.contains { $0.isFavorite } ? "heart.fill" : "heart")
        NavigationView{
            
            List{
                ForEach(foods) { foo in
                    //let item = viewModel.list[i]
                    HStack(alignment: .bottom) {
                        Image(systemName: foo.clicked ? "checkmark.square" : "square")
                            .foregroundStyle(foo.clicked ? Color.lightYellow : Color.black)
                            .onTapGesture {
                                foo.clicked.toggle()
                            }
                        Text(foo.food ?? "teste")
                        ////            onCommit: {
                        ////                    viewModel.addTask(at: i+1)
                        ////                    viewModel.textDidChange(TextField: TextField)
                        ////                    print("Return pressed")
                        ////                }
                            .foregroundStyle(.black)
                        //.focused($focusedField, equals: i)
                         
                        //                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        //                    Button(action: {
                        //                        if let index = viewModel.list.firstIndex(where: { $0.id == item.id }) {
                        //                            viewModel.list[index].isFavorite.toggle()
                        //                        }
                        //                    }) {
                        //                        Text("Favorite")
                        //                    }
                    }
                }.onDelete(perform: deleteBooks)
            
            
            HStack{
                
                Image(systemName: "square")
                TextField("Adicionar", text: $nome)
                
                    .foregroundStyle(.black)
                //.focused($focusedField, equals: i)
                    .onSubmit {
                        //    let newIndex = i + 1
                        let newFood = Teste(context: moc)
                        
                        // newFood.food = $focusedField
                        newFood.id = UUID()
                        newFood.food = nome
                        newFood.clicked = false
                        nome = ""
                        
                        try? moc.save()
                    }
                
            }
            }.listStyle(.plain)

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
    }
    //}
    

