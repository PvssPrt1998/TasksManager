//
//  Coordinator.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import Foundation

class TasksCoordinator: Coordinator {
    
    var children: Array<Coordinator> = []
    var router: Router
    var tasksManager = TasksManager()
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        router.present(TasksViewController(tasksManager: tasksManager, delegate: self), animated: animated, onDismissed: onDismissed)
    }
    
    func dismiss(animated: Bool) { }
}

extension TasksCoordinator: TasksViewControllerDelegate {
    func openTask(_ viewController: TasksViewController, onDismissed: (() -> Void)?) {
        present(animated: true, onDismissed: onDismissed)
    }
    
    func addTaskButtonPressed(_ viewController: TasksViewController, onDismissed: (() -> Void)?) {
        let coordinator = AddTaskCoordinator(router: router, tasksManager: tasksManager)
        presentChild(coordinator, animated: true, onDismissed: onDismissed)
    }
}
