//
//  ViewController.swift
//  TasksManager
//
//  Created by Николай Щербаков on 15.02.2024.
//

import UIKit

protocol TasksViewControllerDelegate: AnyObject {
    func openTask(_ viewController: TasksViewController, onDismissed: (()->Void)?)
    func addTaskButtonPressed(_ viewController: TasksViewController, onDismissed: (()->Void)?)
}

class TasksViewController: UIViewController {
    
    public weak var delegate: TasksViewControllerDelegate?
    var tasksManager: TasksManager
    
    lazy var onDismissed: ()->Void = {
        self.tasksTableView.reloadData()
    }
    
    let taskTitleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = .systemFont(ofSize: 30, weight: .thin)
        return label
    }()
    
    let taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description: "
        label.adjustsFontForContentSizeCategory = true
        label.font = .systemFont(ofSize: 15, weight: .thin)
        return label
    }()
    
    let taskDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
        textView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        return textView
    }()
    
    private lazy var taskDesctiptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            taskDescriptionLabel,
            taskDescriptionTextView
        ])
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var taskStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            taskTitleLabel
        ])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
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
    
    init(tasksManager: TasksManager, delegate: TasksViewControllerDelegate? = nil) {
        self.tasksManager = tasksManager
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("TasksViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc func addButtonAction() {
        delegate?.addTaskButtonPressed(self, onDismissed: onDismissed)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupTaskStackView()
        setupTasksTableView()
        setupAddTaskButton()
    }
    
    private func setupTaskStackView() {
        setupTaskDescriptionStackView()
        taskTitleLabel.text = tasksManager.getCurrentTaskTitle()
        
        view.addSubview(taskStackView)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            taskStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            taskStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            taskStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            taskStackView.bottomAnchor.constraint(lessThanOrEqualTo: margins.bottomAnchor)
        ])
    }
    
    private func setupTaskDescriptionStackView() {
        guard let description = tasksManager.getCurrentTaskDescription() else { return }
        print("notNil \(description)")
        taskDescriptionTextView.text = description
        taskStackView.addArrangedSubview(taskDesctiptionStackView)
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
            tasksTableView.topAnchor.constraint(equalTo: taskStackView.bottomAnchor),
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

