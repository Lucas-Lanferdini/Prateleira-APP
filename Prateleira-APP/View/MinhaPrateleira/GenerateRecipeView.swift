import Foundation
import SwiftUI

struct generateRecipeView: View {

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var foods: FetchedResults<Teste>
    @State var arrayFood: [String] = [""]
    @State var isPressed: Bool = false
    var body: some View {
        Button(action: {
            print("Button action")
            isPressed.toggle()
        })
        {
            ZStack{
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(isPressed ? .recipe : .white)
                    .stroke(isPressed ? Color.recipe : Color.black, lineWidth: 1.0)
                    .frame(width: 149, height: 26)
                Text("Gerar Receita")
                    .foregroundColor(isPressed ? Color.white : Color.black)
                    .font(.callout)
            } .onTapGesture {
                listDespensa()
                isPressed.toggle()
            }.sheet(isPresented: $isPressed) {
                SheetReceitaView(apiReq: ApiReq(ingrediente: arrayFood))
            }
        }
    }
    
    
    func listDespensa(){
        arrayFood = [""]
        print(arrayFood)
        foods.forEach { food in
            // Verifique a idade do objeto
            if food.clicked == true{
                arrayFood.append(food.food ??  "")
            }
        }
    }
}


