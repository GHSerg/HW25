import UIKit

class ModalViewController: UIViewController {
    
    var cardDescription: Card?
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: Metric.labelfontSize)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Закрыть", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    //MARK: - Settings
    
    private func setupView() {
        descriptionLabel.text = "Имя: \n\(cardDescription?.name ?? "nil")\n\n"
        + "Мановая стоимость: \n\(cardDescription?.manaCost ?? "nil")\n\n"
        + "Тип: \n\(cardDescription?.type ?? "nil")\n\n"
        + "Редкость: \n\(cardDescription?.rarity ?? "nil")\n\n"
        + "Название сета: \n\(cardDescription?.setName ?? "nil")\n\n"
        + "Художник: \n\(cardDescription?.artist ?? "nil")\n\n"
        + "Количество: \n\(cardDescription?.number ?? "nil")\n\n"
    }
    
    private func setupHierarchy() {
        view.addSubview(descriptionLabel)
        view.addSubview(button)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: Metric.labelTopOffset),
            button.widthAnchor.constraint(equalToConstant: Metric.buttonWidth),
            button.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                             constant: Metric.buttonSafeAreaLayoutGuideTrailingAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    //MARK: - Actions
    
    @objc private func buttonAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Constants

extension ModalViewController {
    enum Metric {
        static let labelfontSize: CGFloat = 24
        static let labelTopOffset: CGFloat = 40
        static let buttonWidth: CGFloat = 70
        static let buttonHeight: CGFloat = 40
        static let buttonSafeAreaLayoutGuideTrailingAnchor: CGFloat = -10
    }
}
