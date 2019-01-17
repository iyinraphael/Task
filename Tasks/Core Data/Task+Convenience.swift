//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Dave DeLong on 1/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData


//Task cannot conform to Codable Protocol so we have to make an intermediary struct
extension Task {
    
    convenience init(name: String,
                     notes: String? = nil,
                     identifier: UUID = UUID(),
                     priority:TaskPriority = .normal,
                     managedObjectContext: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: managedObjectContext)
        self.name = name
        self.notes = notes
        self.priority = priority.rawValue
        self.identifier = identifier
        
    }
    
    
    //Change Task to TaskRepresentation
    convenience init(taskRepresentation: TaskRepresentation, managedObjectContext: NSManagedObjectContext = CoreDataStack.shared.mainContext){
        self.init(name: taskRepresentation.name, notes: taskRepresentation.notes, identifier: taskRepresentation.identifier, priority: taskRepresentation.priority, managedObjectContext: managedObjectContext)
    }
    
    
    //Change taskRepresentation to Task
    var taskRepresentation: TaskRepresentation? {
        
        guard let name = name,
            let priorityString = priority,
        let priority = TaskPriority(rawValue: priorityString) else {
                return nil
        }
        
        if identifier == nil {
            identifier = UUID()
        }
        
        return TaskRepresentation(name: name, notes: notes, priority: priority, identifier: identifier!)
        
    }
}
