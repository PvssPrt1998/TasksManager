//
//  TasksTableViewCell.swift
//  TasksManager
//
//  Created by Николай Щербаков on 02.03.2024.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TasksTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    public func setDescription(_ description: String?) {
        descriptionLabel.text = description
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupView() {
        contentView.addSubview(stackView)
    }
    
    private func setupStackView() {
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
}
