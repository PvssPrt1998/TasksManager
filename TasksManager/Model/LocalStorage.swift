//
//  LocalStorage.swift
//  TasksManager
//
//  Created by Николай Щербаков on 10.03.2024.
//

import Foundation
import CoreData

class LocalStorage {
    
    enum LocalStorageError: Error {
        case cannotGetDataVersionFromLocalStorage
        case cannotGetTaskFromLocalStorage
        case cannotCreateServiceTask
    }
    
    private let modelName = "Task"
    var localVersion: DataVersion!
    
    lazy var coreDataStack = CoreDataStack(modelName: modelName)
    
    init() {
        //try! removeAll()
        setLocalVersion()
        createServiceTaskIfNeeded()
    }
    
    func setLocalVersion() {
        do {
            let results = try coreDataStack.managedContext.fetch(DataVersion.fetchRequest())
            if results.count > 0 {
                localVersion = results.first
            } else {
                localVersion = DataVersion(context: coreDataStack.managedContext)
                localVersion.version = Date().getDateString()
                localVersion.freeID = Int32(ServiceID.getFirstFreeID())
                coreDataStack.saveContext()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    
    func getFreeID() -> Int32 {
        localVersion.freeID
    }
    
    func updateDataVersion() {
        updateVersion()
        incrementFreeID()
        coreDataStack.saveContext()
    }
    
    func updateVersion() {
        localVersion.version = Date().getDateString()
    }
    
    func incrementFreeID() {
        localVersion.freeID = localVersion.freeID + 1
    }
    
    func createServiceTaskIfNeeded() {
        do {
            try createServiceTaskIfNeeded(by: ServiceID.GlobalTask.rawValue, with: "Global tasks")
            try createServiceTaskIfNeeded(by: ServiceID.TodayTask.rawValue, with: "Today's tasks")
            try createServiceTaskIfNeeded(by: ServiceID.FailedTask.rawValue, with: "Failed tasks")
            try createServiceTaskIfNeeded(by: ServiceID.CompletedTask.rawValue, with: "Completed tasks")
        } catch let error as NSError {
            print("Error: \(error) description: \(error.userInfo) lel le le")
        }
    }
    
    func createServiceTaskIfNeeded(by id: Int, with title: String) throws {
        try isTaskExist(by: id) ? () : createTaskByID(title: title, objID: Int32(id))
    }
    
    func createTask(title: String, description: String? = nil, head: Task) {
        createTaskByID(title: title, description: description, objID: getFreeID(), head: head)
        updateDataVersion()
    }
    
    private func createTaskByID(title: String, description: String? = nil, objID: Int32, head: Task? = nil) {
        let task = Task(context: coreDataStack.managedContext)
        task.objID = objID
        task.title = title
        task.taskDescription = description
        task.subtasksIDList = []
        if head != nil {
            task.headID = head!.objID
            head!.subtasksIDList.append(objID as NSNumber)
        }
        coreDataStack.saveContext()
    }
    
    func taskFetchRequest(by id: Int) -> NSFetchRequest<Task> {
        let taskFetch = Task.fetchRequest()
        taskFetch.predicate = NSPredicate(format: "%K == %i", #keyPath(Task.objID), id)
        return taskFetch
    }
    
    func isTaskExist(by id: Int) throws -> Bool {
        try getCountOfTasks(by: id) > 0
    }
    
    func getCountOfTasks(by id: Int) throws -> Int {
        try coreDataStack.managedContext.fetch(taskFetchRequest(by: id)).count
    }
    
    func getTask(by id: Int) throws -> Task {
        try coreDataStack.managedContext.fetch(taskFetchRequest(by: id)).first ?? throwError(LocalStorageError.cannotGetTaskFromLocalStorage)
    }
    
    func removeTask(by id: Int) throws {
        try coreDataStack.managedContext.delete(getTask(by: id))
        coreDataStack.saveContext()
    }
    
    func removeAll() throws {
        for i in 0...16 {
            try coreDataStack.managedContext.delete(getTask(by: i))
            coreDataStack.saveContext()
        }
    }
}
