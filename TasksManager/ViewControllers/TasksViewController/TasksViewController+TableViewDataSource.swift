//
//  TasksViewController+TableViewDataSource.swift
//  TasksManager
//
//  Created by Николай Щербаков on 02.03.2024.
//

import UIKit

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TasksTableViewCell.reuseIdentifier) as? TasksTableViewCell else {
            fatalError("The TableView could not dequeue a Custom Cell in ViewController")
        }
        
        if !taskArray[indexPath.row].isFinalTask() {
            cell.taskType(.composite)
        } else { cell.taskType(.final) }
        
        cell.setTitle(taskArray[indexPath.row].title)
        cell.setDescription(taskArray[indexPath.row].description)
        
        return cell
    }
}
