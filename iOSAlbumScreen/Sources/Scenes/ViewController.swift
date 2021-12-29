import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!

    var dataSource = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.configure()
        setupTableView()
    }

    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = UIView()
        table.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
        table.register(RegularTableViewCell.self, forCellReuseIdentifier: RegularTableViewCell.identifier)
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifier) as! CustomHeaderView
        header.contentViewSize = tableView.tableHeaderView?.frame.size ?? CGSize()

        let model = dataSource.sectionTitles[section]
        header.configure(with: model)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 570
            case 1, 2:
                return 280
            case 3, 4:
                return 44
            default:
                return 44
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return 1
            case 1: return 1
            case 2: return 1
            case 3: return dataSource.mediaTypes.count
            case 4: return dataSource.utilities.count
            default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
                let model = Model(myAlbums: dataSource.myAlbums, type: .myAlbums)
                cell.configure(with : model)
                return cell

            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
                let model = Model(sharedAlbums: dataSource.sharedAlbums, type: .sharedAlbums)
                cell.configure(with : model)
                return cell

            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
                let model = Model(peopleAndPlaces: dataSource.peopleAndPlaces, type: .peopleAndPlaces)
                cell.configure(with : model)
                return cell

            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: RegularTableViewCell.identifier, for: indexPath) as! RegularTableViewCell
                cell.configure(with: dataSource.mediaTypes[indexPath.row])
                return cell

            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: RegularTableViewCell.identifier, for: indexPath) as! RegularTableViewCell
                cell.configure(with: dataSource.utilities[indexPath.row])
                return cell
            default: return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            let separator = cell.subviews.filter({
                $0.frame.minY == 0 && $0 !== cell.contentView
            }).first
            separator?.isHidden = true
        }

        cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
    }
}
