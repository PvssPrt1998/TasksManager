//
//  Task.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

//import Foundation
//
//class Task: TaskComponent {
//    var head: TaskComponent? = nil
//    var taskComponents: Array<TaskComponent> = []
//    
//    let title: String
//    var description: String?
//    
//    init(title: String, description: String? = nil) {
//        self.title = title
//        self.description = description
//    }
//    
//    func getTitle() -> String {
//        return title
//    }
//    
//    func getDescription() -> String? {
//        return description
//    }
//    
//    func add(task: Task) {
//        task.head = self
//        taskComponents.append(task)
//    }
//    
//    func remove(taskComponent: TaskComponent) {
//        //TODO: - describe remove method
//    }
//    
//    func isFinalTask() -> Bool {
//        taskComponents.count == 0 ? true : false
//    }
//}
