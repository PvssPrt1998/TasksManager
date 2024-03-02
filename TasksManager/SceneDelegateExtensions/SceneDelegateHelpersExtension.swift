//
//  SceneDelegateHelpersExtension.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import UIKit

extension SceneDelegate {
    func createWindowScene(with scene: UIScene) throws -> UIWindowScene {
        try scene as? UIWindowScene ?? throwError(SceneDelegateError.invalidCreationWindowSceneWithScene)
    }
    
    func createWindow(with scene: UIScene) throws -> UIWindow {
        try UIWindow(windowScene: createWindowScene(with: scene))
    }
    
    func createRouter(with window: UIWindow?) throws -> Router {
        try NavigationRouter(window: window ?? throwError(SceneDelegateError.windowIsNotCreated))
    }
    
    func createCoordinator(with window: UIWindow?) throws -> TasksCoordinator {
        try TasksCoordinator(router: createRouter(with: window))
    }
    
    func configure(scene: UIScene) {
        window = try? createWindow(with: scene)
        tasksCoordinator = try? createCoordinator(with: window)
    }
    
    func present(by tasksCoordinator: TasksCoordinator?) {
        tasksCoordinator?.present(animated: true, onDismissed: nil)
    }
}
