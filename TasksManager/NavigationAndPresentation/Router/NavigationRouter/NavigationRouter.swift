//
//  NavigationRouter.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import UIKit

class NavigationRouter: NSObject, Router {
    
    public let window: UIWindow?
    private let navigationController = UINavigationController()
    private var onDismissForViewController: [UIViewController: (()->Void)] = [:]
    
    init(window: UIWindow) {
        self.window = window
        self.window?.rootViewController = navigationController
        window.makeKeyAndVisible()
        super.init()
    }
    
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool) { }
}

