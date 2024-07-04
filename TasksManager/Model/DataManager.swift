//
//  DataManager.swift
//  TasksManager
//
//  Created by Николай Щербаков on 10.03.2024.
//

import Foundation

class DataManager {
    var localStorage = LocalStorage()
    lazy var remoteStorage = RemoteStorage()
}
