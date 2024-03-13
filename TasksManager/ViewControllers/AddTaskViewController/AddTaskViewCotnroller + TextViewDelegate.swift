//
//  AddTaskViewCotnroller + TextViewDelegate.swift
//  TasksManager
//
//  Created by Николай Щербаков on 13.03.2024.
//

import UIKit

extension AddTaskViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        addTaskButtonActiveCondition()
    }
}
