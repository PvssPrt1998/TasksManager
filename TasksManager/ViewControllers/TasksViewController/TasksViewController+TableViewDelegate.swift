//
//  TasksViewController+TableViewDelegate.swift
//  TasksManager
//
//  Created by Николай Щербаков on 02.03.2024.
//

import UIKit

extension TasksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasksManager.setCurrentTask(by: tasksManager.getCurrentTaskSubtask(by: indexPath.row))
        print("CURRENTTASKTITLE: \(tasksManager.getCurrentTaskTitle())")
        delegate?.openTask(self, onDismissed: onDismissed)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
