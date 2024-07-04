//
//  TasksManager.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import Foundation

class TasksManager {
    
    enum er: Error {
        case error1
    }
    
    var dataManager = DataManager()
    
    private var currentTaskID: Int = ServiceID.GlobalTask.rawValue
    private var currentTask: Task!
    
    init() {
        setCurrentTask(by: currentTaskID)
    }
    
    func getCurrentTaskTitle() -> String {
        currentTask.title ?? "Unable to get tasks title"
    }
    
    func getCurrentTaskDescription() -> String? {
        currentTask.taskDescription
    }
    
    func getCountCurrentTaskSubtasks() -> Int {
        currentTask.subtasksIDList.count
    }
    
    func getCurrentTaskSubtask(by index: Int) -> Int {
        Int(truncating: currentTask.subtasksIDList[index])
    }
    
    func getTaskTitle(by id: Int) -> String {
        (try? dataManager.localStorage.getTask(by: id).title)!
    }
    
    func getTaskDescription(by id: Int) -> String? {
        try? dataManager.localStorage.getTask(by: id).taskDescription
    }
    
    func createTask(title: String, description: String? = nil) {
        dataManager.localStorage.createTask(title: title,
                                            description: description,
                                            head: currentTask)
    }
    
    func setCurrentTask(by id: Int) {
        do {
            currentTask = try dataManager.localStorage.getTask(by: id)
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
}
