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
    
    public init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        router.present(AddTaskViewController(delegate: self), animated: animated, onDismissed: onDismissed)
    }
}

extension AddTaskCoordinator: AddTaskViewControllerDelegate {
    func addTask(_ viewController: TasksViewController, onDismissed: (() -> Void)?) {
        
    }
}
