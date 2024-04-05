import Foundation
import SwiftUI

struct ToDoList: Identifiable {
    var id = UUID()
    var food: String
    var clicked: Bool = false
//    var isFavorite: Bool = false
    
    mutating func setFood(newFood: String) {
        food = newFood
    }
    
    mutating func toggleClick() {
        clicked.toggle()
    }
    
//    mutating func toggleIsFavorite() {
//        isFavorite.toggle()
//    }
}
//class ToDoList: Identifiable, ObservableObject {
//    var id = UUID()
//    @Published var food: String
//    var clicked: Bool = false
//    
//    init(food: String, clicked: Bool = false) {
//        self.food = food
//        self.clicked = clicked
//    }
//    
//    func toggleClick() {
//        clicked.toggle()
//    }
//}
