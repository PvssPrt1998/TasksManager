//
//  AddTaskViewController.swift
//  TasksManager
//
//  Created by Николай Щербаков on 07.03.2024.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func addTaskButtonPressed()
}

class AddTaskViewController:  UIViewController {
    
    public weak var delegate: AddTaskViewControllerDelegate?
    var tasksManager: TasksManager
    
    let addTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title: "
        label.adjustsFontForContentSizeCategory = true
        label.font = .systemFont(ofSize: 30, weight: .thin)
        return label
    }()

    let addTitleTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        textView.isScrollEnabled = false
        textView.textContainer.maximumNumberOfLines = 1
        textView.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
        return textView
    }()
    
    let addDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description: "
        label.adjustsFontForContentSizeCategory = true
        label.font = .systemFont(ofSize: 30, weight: .thin)
        return label
    }()
    
    let addDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        textView.isScrollEnabled = true
        textView.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
        textView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        return textView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            addTitleLabel,
            addTitleTextView,
            addDescriptionLabel,
            addDescriptionTextView,
            addTaskButton
        ])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    private let addTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.plain()
        config.title = "Add task"
        config.baseForegroundColor = .darkGray
        button.configuration = config
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    init(delegate: AddTaskViewControllerDelegate? = nil, tasksManager: TasksManager) {
        self.tasksManager = tasksManager
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("AddTaskViewController deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    @objc func addTaskButtonAction() {
        tasksManager.createTask(title: addTitleTextView.text, description: addDescriptionTextView.text)
        delegate?.addTaskButtonPressed()
    }
    
    private func setupView() {
        setupScrollView()
        setupMainStackView()
        setupAddTaskButton()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupMainStackView() {
        addTitleTextView.delegate = self
        
        addDescriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        addDescriptionTextView.layer.borderWidth = 0.2
        addDescriptionTextView.layer.cornerRadius = 10
        addTitleTextView.layer.borderColor = UIColor.lightGray.cgColor
        addTitleTextView.layer.borderWidth = 0.2
        addTitleTextView.layer.cornerRadius = 10
        scrollView.addSubview(mainStackView)
        let margins = scrollView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            mainStackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            margins.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 10),
            mainStackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupAddTaskButton() {
        addTaskButton.addTarget(self, action: #selector(addTaskButtonAction), for: .touchUpInside)
        makeAddTaskButtonInactive()
    }
    
    func addTaskButtonActiveCondition() {
        if addTitleTextView.text == "" {
            makeAddTaskButtonInactive()
        } else {
            makeAddTaskButtonActive()
        }
    }
    
    private func makeAddTaskButtonActive() {
        addTaskButton.alpha = 1.0
        addTaskButton.isEnabled = true
    }
    
    private func makeAddTaskButtonInactive() {
        addTaskButton.alpha = 0.1
        addTaskButton.isEnabled = false
    }
}
