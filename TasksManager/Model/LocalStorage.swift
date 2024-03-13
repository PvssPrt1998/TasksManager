//
//  LocalStorage.swift
//  TasksManager
//
//  Created by Николай Щербаков on 10.03.2024.
//

import Foundation

class LocalStorage {
    
    enum LocalStorageError: Error {
        case cannotGetDataVersionFromLocalStorage
    }
    
    private let modelName = "Tasks"
    
    lazy var coreDataStack = CoreDataStack(modelName: modelName)
    
    func getVersion() throws -> String {
        return try coreDataStack.managedContext.fetch(DataVersion.fetchRequest()).first?.version ?? throwError(LocalStorageError.cannotGetDataVersionFromLocalStorage)
    }
    
    func createTask(title: String, description: String) {
        let task = Task(context: coreDataStack.managedContext)
        task.title = title
        task.taskDescription = description
    }
}
