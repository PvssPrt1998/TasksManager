//
//  ThrowErrorHelper.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import Foundation

public func throwError<T>(_ error: Error) throws -> T {
    throw error
}
