//
//  AddTaskCoordinator.swift
//  TasksManager
//
//  Created by Николай Щербаков on 07.03.2024.
//

import Foundation

public class AddTaskCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    
    var router: Router
    var tasksManager: TasksManager
    
    init(router: Router, tasksManager: TasksManager) {
        self.router = router
        self.tasksManager = tasksManager
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        router.present(AddTaskViewController(delegate: self, tasksManager: tasksManager), animated: animated, onDismissed: onDismissed)
    }
}

extension AddTaskCoordinator: AddTaskViewControllerDelegate {
    func addTaskButtonPressed() {
        print("AddTaskCoordinator Dissmiss begin")
        dismiss(animated: true)
        print("AddTaskCoordinator Dissmiss end")
    }
}
