//
//  Task+CoreDataProperties.swift
//  TasksManager
//
//  Created by Николай Щербаков on 10.03.2024.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var headID: Int32
    @NSManaged public var title: String?
    @NSManaged public var taskDescription: String?
    @NSManaged public var subtasksIDList: NSObject?
    @NSManaged public var globalTasks: GlobalTasks?

}

extension Task : Identifiable {

}
