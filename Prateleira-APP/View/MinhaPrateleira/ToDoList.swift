import Foundation
class ToDoListViewModel: ObservableObject {
    
   // @Environment(\.managedObjectContext) var moc

    //let newFood = ToDo(context:  moc)

    @Published var list: [ToDoList] = [
        ToDoList(food: "Pão Branco"),
        ToDoList(food: "Chocolate"),
        ToDoList(food: "Amendoim"),
        ToDoList(food: "Amido de Milho"),
        ToDoList(food: "Massa"),
        ToDoList(food: "Molho de Tomate"),
        ToDoList(food: "Alface"),
        ToDoList(food: "Lagosta"),
        ToDoList(food: "Suco de Laranja")
    ]

//    func addTask(task: ToDoList) {
//        list.append(task)
//    }
//    
//    func addTask(task: ToDoList, at index: Int) {
//        list.insert(task, at: index)
//    }
    
    func addTask(at index: Int) {
        list.insert(ToDoList(food: ""), at: index)
    }
    
//    func textDidChange(textField: UITextField){
//        let text: textField.text
//        if text?.count == 1{
//            switch textField{
//            case otpTextField1:
//                otpTextField2.becomeFirstResponder()
//            }
//        }
//    }

    func removeTask(id: UUID) {
        if let index = list.firstIndex(where: { $0.id == id }) {
            list.remove(at: index)
        }
    }

    func seeList() {
        for aux in list {
            print(aux)
        }
    }
}

