//
//  Task.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import Foundation

protocol TaskComponent {
    func getTitle() -> String
    func getDescription() -> String?
    func add(taskComponent: TaskComponent)
    func remove(taskComponent: TaskComponent)
    func isFinalTask() -> Bool
}

extension TaskComponent {
    func add(taskComponent: TaskComponent) { }
    func remove(taskComponent: TaskComponent) { }
}
