//
//  ViewController.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import UIKit

protocol TasksViewControllerDelegate: AnyObject {
    func openTask(_ viewController: TasksViewController, onDismissed: (()->Void)?)
}

class TasksViewController: UIViewController {
    
    var taskArray = [
        Task(title: "Task1", description: "Description1"),
        Task(title: "Task2", description: "Description2"),
        Task(title: "Task3", description: "Description3"),
        Task(title: "Task4", description: "Description4"),
        Task(title: "Task5", description: "Description5"),
        Task(title: "Task6", description: "Description6"),
        Task(title: "Task7", description: "Description7")
    ]
    
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
        setupView()
    }
    
    private func setupView() {
        setupTasksTableView()
    }
    
    private func setupTasksTableView() {
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
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

