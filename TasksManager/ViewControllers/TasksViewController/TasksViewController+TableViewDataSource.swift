//
//  TasksViewController+TableViewDataSource.swift
//  TasksManager
//
//  Created by Николай Щербаков on 02.03.2024.
//

import UIKit

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksManager.getCountCurrentTaskSubtasks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TasksTableViewCell.reuseIdentifier) as? TasksTableViewCell else {
            fatalError("The TableView could not dequeue a Custom Cell in ViewController")
        }
        cell.setTitle(tasksManager.getTaskTitle(by: tasksManager.getCurrentTaskSubtask(by: indexPath.row)))
        cell.setDescription(tasksManager.getTaskDescription(by: tasksManager.getCurrentTaskSubtask(by: indexPath.row)))
        return cell
    }
}
