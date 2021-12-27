//
//  ViewController.swift
//  iOSAlbumScreen
//
//  Created by matt_spb on 26.12.2021.
//

// убрать сепаратор под хедером
// свдинуть сепаратор ячеек до начала текста
//поставить сердечко на ячейке favorites

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!

    var dataSource = Model(mediaTypes: [], utilities: [], sectionTitles: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.configure()
        setupTableView()
    }

    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = UIView()
//        table.separatorColor = .clear
        table.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
        table.register(RegularTableViewCell.self, forCellReuseIdentifier: RegularTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifier) as! CustomHeaderView
        header.contentViewSize = tableView.tableHeaderView?.frame.size ?? CGSize()
        header.configure(with: dataSource.sectionTitles[section])
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
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
        return 44
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
            case 0: return UITableViewCell()
            case 1: return UITableViewCell()
            case 2: return UITableViewCell()
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
//        let contentView = cell.contentView
//        if
//            // this separator is subview of first UITableViewCell in section
//            indexPath.row == 0,
//            // truing to find it in subviews
//            let divider = cell.subviews.filter({ $0.frame.minY == 0 && $0 !== contentView }).first
//        {
//            divider.isHidden = true
//        }
//        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)

//        if indexPath.row == 0 {
//            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
//        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

    }
}
