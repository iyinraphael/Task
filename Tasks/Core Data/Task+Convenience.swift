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
    
}
