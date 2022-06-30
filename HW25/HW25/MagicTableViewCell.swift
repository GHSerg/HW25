//
//  MagicTableViewCell.swift
//  HW25
//
//  Created by Sergey Bodnar on 30.06.2022.
//

import UIKit

class MagicTableViewCell: UITableViewCell {
    
    static let identifier = "MagicTableViewCell"
    
    // MARK: - Elements
    
//    private lazy var stackViewHorizontal: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
//    private lazy var stackViewHorizontal: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.alignment = .leading
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//    
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var type: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var accessoryTableViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    private lazy var switchAirplane: UISwitch = {
//        let mySwitch = UISwitch()
//        mySwitch.translatesAutoresizingMaskIntoConstraints = false
//        return mySwitch
//    }()
//
//    private lazy var infoWiFi: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 16)
//        label.textAlignment = .right
//        label.text = "Не подключено"
//        label.isEnabled = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//
//    private lazy var infoMainButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .red
//        button.layer.cornerRadius = 15
//        button.setTitle("1", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//
//    private lazy var infoBluetoothLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 16)
//        label.textAlignment = .right
//        label.text = "Вкл."
//        label.isEnabled = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var switchVPN: UISwitch = {
//        let mySwitch = UISwitch()
//        mySwitch.translatesAutoresizingMaskIntoConstraints = false
//        return mySwitch
//    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackViewVertical)
       // stackViewHorizontal.addArrangedSubview(iconImageView)
        stackViewVertical.addArrangedSubview(name)
        stackViewVertical.addArrangedSubview(type)
        stackViewVertical.addArrangedSubview(setName)
       // stackViewVertical.addArrangedSubview(stackViewHorizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        accessoryTableViewCell.removeFromSuperview()
    }
    
    override func layoutSubviews () {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Metric.stackViewHorizontalTopConstraintContentView
            ),
            stackViewVertical.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Metric.stackViewHorizontalBottomConstraintContentView
            ),
            stackViewVertical.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Metric.stackViewHorizontalLeadingConstraintContentView
            ),
            stackViewVertical.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Metric.stackViewHorizontalTrailingConstraintContentView
            ),
        ])
    }
    
    
    // MARK: - Configure
    
    func configure(with cell: String) {
        name.text = cell + "name"
        type.text = cell + "type"
        setName.text = cell + "setName"
        
//        iconImageView.image = UIImage(named: cell.imageCell)
//        nameLabel.text = cell.textCell
//
//        switch cell.textCell  {
//        case "Авиарежим":
//            accessoryTableViewCell = switchAirplane
//        case "Wi-Fi":
//            accessoryType = .disclosureIndicator
//            accessoryTableViewCell = infoWiFi
//        case "Bluetooth":
//            accessoryType = .disclosureIndicator
//            accessoryTableViewCell = infoBluetoothLabel
//        case "VPN":
//            accessoryTableViewCell = switchVPN
//        case "Основные":
//            accessoryType = .disclosureIndicator
//            accessoryTableViewCell = infoMainButton
//        default:
//            accessoryType = .disclosureIndicator
//            accessoryTableViewCell = UIView()
//        }
//        stackViewHorizontal.addArrangedSubview(accessoryTableViewCell)
    }
}

// MARK: - Metrics

extension MagicTableViewCell {
    enum Metric {
        static let iconImageViewSize: CGFloat = 32
        static let stackViewHorizontalTopConstraintContentView: CGFloat = 6
        static let stackViewHorizontalBottomConstraintContentView: CGFloat = -6
        static let stackViewHorizontalLeadingConstraintContentView: CGFloat = 10
        static let stackViewHorizontalTrailingConstraintContentView: CGFloat = -10
    }
}
