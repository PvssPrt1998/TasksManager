//
//  Coordinator.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import Foundation

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var router: Router { get set }
    
    func present(animated: Bool, onDismissed: (()->Void)?)
    func dismiss(animated: Bool)
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (()->Void)?)
}

extension Coordinator {
    public func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    public func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (()->Void)? = nil) {
        children.append(child)
        child.present(animated: animated) { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        }
    }
    
    private func removeChild(_ child: Coordinator) {
        children.removeAll { $0 === child }
    }
}
