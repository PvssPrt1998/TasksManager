//
//  DataVersion+CoreDataProperties.swift
//  TasksManager
//
//  Created by Николай Щербаков on 10.03.2024.
//
//

import Foundation
import CoreData


extension DataVersion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataVersion> {
        return NSFetchRequest<DataVersion>(entityName: "DataVersion")
    }

    @NSManaged public var version: String?

}

extension DataVersion : Identifiable {

}
