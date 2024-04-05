//
//  DataControllerHist.swift
//  Prateleira-APP
//
//

import CoreData
import Foundation
    

class DataControllerHist: ObservableObject {
    let container = NSPersistentContainer(name: "Data")
    
    
    init(){
        container.loadPersistentStores { descriptoin, error in
            if let error = error{
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
