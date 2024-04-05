//
//  DataControllerToDo.swift
//  Prateleira-APP
//
//  Created by Foundation16 on 24/11/23.
//
import CoreData
import Foundation
    

class DataControllerToDo: ObservableObject {
    let container = NSPersistentContainer(name: "DataFood")
    
    
    init(){
        container.loadPersistentStores { descriptoin, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
