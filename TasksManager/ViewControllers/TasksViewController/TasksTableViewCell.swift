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
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackView.axis = .horizontal
        stackView.distribution = .fill
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
        if description != nil {
            descriptionLabel.text = description
            textStackView.addArrangedSubview(descriptionLabel)
            containerStackView.addArrangedSubview(arrowImageView)
        }
    }
    
    private func setupView() {
        setupStackView()
        selectionStyle = .none
    }
    
    private func setupStackView() {
        contentView.addSubview(containerStackView)
        
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            margins.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            margins.topAnchor.constraint(equalTo: containerStackView.topAnchor),
            margins.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
            margins.bottomAnchor.constraint(equalTo: containerStackView.bottomAnchor)
        ])
    }
}
