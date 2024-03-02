//
//  ViewController.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import UIKit

protocol TasksViewControllerDelegate: AnyObject {
    //TODO: - Подобрать подходящее название для метода
    func action(_ viewController: TasksViewController, onDismissed: (()->Void)?)
}

class TasksViewController: UIViewController {
    
    var taskArray = [
        Subtask(title: "Task1", description: "Description1"),
        Subtask(title: "Task2", description: "Description2"),
        Subtask(title: "Task3", description: "Description3"),
        Subtask(title: "Task4", description: "Description4"),
        Subtask(title: "Task5", description: "Description5"),
        Subtask(title: "Task6", description: "Description6"),
        Subtask(title: "Task7", description: "Description7")
    ]
    
    enum TasksViewControllerError: Error {
        case invalidCreationCustomTableViewCell
    }
    
    public weak var delegate: TasksViewControllerDelegate?
    
    let tasksTableView: UITableView = {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    init(delegate: TasksViewControllerDelegate? = nil) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        setupView()
    }
    
    private func setupView() {
        setupTasksTableView()
    }
    
    private func setupTasksTableView() {
        tasksTableView.register(
            TasksTableViewCell.self,
            forCellReuseIdentifier: TasksTableViewCell.reuseIdentifier)
        
        view.addSubview(tasksTableView)
        NSLayoutConstraint.activate([
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.topAnchor.constraint(equalTo: view.topAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

