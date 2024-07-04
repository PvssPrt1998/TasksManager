//
//  getDateString.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.03.2024.
//

import Foundation

public extension Date {
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMyyyyHHmm"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
