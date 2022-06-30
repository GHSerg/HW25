import UIKit
import Alamofire

final class ViewController: UIViewController {

    var tableData = [CardJSON]()
    let url = "https://api.magicthegathering.io/v1/cards?"

    // MARK: - Views

    private lazy var magicTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableView.register(MagicTableViewCell.self, forCellReuseIdentifier: MagicTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()// иерархия
        setupLayout() // констрейнты, стеки
        requestUrl()

    }

    // MARK: - Settings

    private func setupHierarchy() {
        view.addSubview(magicTableView)

    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            magicTableView.topAnchor.constraint(equalTo: view.topAnchor),
            magicTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            magicTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            magicTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func requestUrl() {
        AF.request(url).responseDecodable(of: CardsJSON.self) { response in
            guard let dataJSON = response.value else { return }
            self.tableData = dataJSON.cards
            self.magicTableView.reloadData()
        }
    }
}

// MARK: - Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MagicTableViewCell.identifier, for: indexPath) as? MagicTableViewCell else { return UITableViewCell()}
        cell.configure(with: tableData[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        //  print("Нажата ячейка - \(settingsTable.sectionsTable[indexPath.section].tableCell[indexPath.row].textCell)")
    }
}
