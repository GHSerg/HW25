import UIKit

class MagicTableViewCell: UITableViewCell {

    static let identifier = "MagicTableViewCell"

    // MARK: - Elements

    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

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

    
    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(name)
        stackViewVertical.addArrangedSubview(type)
        stackViewVertical.addArrangedSubview(setName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }

    override func layoutSubviews () {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Metric.stackViewVerticalTopConstraintContentView
            ),
            stackViewVertical.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Metric.stackViewVerticalBottomConstraintContentView
            ),
            stackViewVertical.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Metric.stackViewVerticalLeadingConstraintContentView
            ),
            stackViewVertical.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Metric.stackViewVerticalTrailingConstraintContentView
            )
        ])
    }

    // MARK: - Configure

    func configure(with cell: Card) {
        name.text = cell.name
        type.text = "Тип: \(cell.type ?? "nil")"
        setName.text = "Название сета: \(cell.setName ?? "nil")"
    }
}

// MARK: - Metrics

extension MagicTableViewCell {
    enum Metric {
        static let stackViewVerticalTopConstraintContentView: CGFloat = 6
        static let stackViewVerticalBottomConstraintContentView: CGFloat = -6
        static let stackViewVerticalLeadingConstraintContentView: CGFloat = 10
        static let stackViewVerticalTrailingConstraintContentView: CGFloat = -10
    }
}
