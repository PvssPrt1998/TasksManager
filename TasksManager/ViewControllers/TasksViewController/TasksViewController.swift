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
    
    let addTaskButton: AddTaskButton = {
        let button = AddTaskButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
    
    @objc func addButtonAction() {
        print("addButtonPressed")
    }
    
    private func setupView() {
        setupTasksTableView()
        setupAddTaskButton()
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
    
    private func setupAddTaskButton() {
        addTaskButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        view.addSubview(addTaskButton)
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            addTaskButton.heightAnchor.constraint(equalToConstant: 100),
            addTaskButton.widthAnchor.constraint(equalTo: addTaskButton.heightAnchor, multiplier: 1.0),
            margins.trailingAnchor.constraint(equalTo: addTaskButton.trailingAnchor, constant: 30),
            margins.bottomAnchor.constraint(equalTo: addTaskButton.bottomAnchor, constant: 40)
        ])
    }
}

