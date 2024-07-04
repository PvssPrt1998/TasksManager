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
        addBackButton(to: viewController)
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool) { 
        guard let viewController = navigationController.topViewController else { return }
        print("Router Dismiss")
        performOnDismissed(for: viewController)
        navigationController.popViewController(animated: animated)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
    
    private func addBackButton(to viewController: UIViewController) {
        guard !navigationController.viewControllers.isEmpty else { return }
        let image = UIImage(systemName: "chevron.left")
        guard let image = image else { return }
        let leftBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonPressed))
        leftBarButton.tintColor = .black
        viewController.navigationItem.leftBarButtonItem = leftBarButton
    }
}

