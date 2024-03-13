//
//  TasksManager.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import Foundation

class TasksManager {
    
    let tasks: TaskComponent
    
    lazy var dataManager = DataManager()
    
    init(tasks: TaskComponent) {
        self.tasks = tasks
    }
    
    func createTask(title: String, description: String) {
        dataManager.localStorage.createTask(title: title, description: description)
    }
}
