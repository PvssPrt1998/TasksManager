//
//  Router.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import UIKit

public protocol Router {
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?)
    func dismiss(animated: Bool)
}

extension Router {
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: true, onDismissed: nil)
    }
}
