import UIKit
import Alamofire

final class MainViewController: UIViewController {
    
    var tableData = [CardJSON]()
    let url = "https://api.magicthegathering.io/v1/cards?"
    
    // MARK: - Views
    
    private lazy var magicTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(MagicTableViewCell.self, forCellReuseIdentifier: MagicTableViewCell.identifier)
        tableView.rowHeight = 90 // если убрать, то размер ячеек изначально по умолчанию 
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        requestUrl()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(magicTableView)
    }
    
    private func setupLayout() {
        magicTableView.frame = view.bounds
    }
    
    func requestUrl() {
        AF.request(url).responseDecodable(of: CardsJSON.self) { response in
            guard let dataJSON = response.value else { return }
            self.tableData = dataJSON.cards
            print(self.tableData)
            self.magicTableView.reloadData()
        }
    }
}

// MARK: - Extension
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        let modalVC = ModalViewController()
        
        modalVC.modalTransitionStyle = .flipHorizontal
        modalVC.cardDescription = tableData[indexPath.row]
        self.present(modalVC, animated: true, completion: nil)
    }
}
