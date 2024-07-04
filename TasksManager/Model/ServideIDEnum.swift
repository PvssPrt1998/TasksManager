//
//  ServideIDenum.swift
//  TasksManager
//
//  Created by Николай Щербаков on 16.03.2024.
//

import Foundation

enum ServiceID: Int, CaseIterable {
    case GlobalTask
    case TodayTask
    case FailedTask
    case CompletedTask
    
    static func getFirstFreeID() -> Int {
        Self.allCases.count
    }
}
