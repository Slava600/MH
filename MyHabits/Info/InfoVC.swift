//
//  InfoVC.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 25.03.2022.
//

import UIKit

class InfoVC: UIViewController {
    
    lazy var infoTabelView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.toAutoLayout()
        table.backgroundColor = .white
        table.isScrollEnabled = true
        table.separatorInset = .zero
        table.rowHeight = UITableView.automaticDimension
        table.refreshControl?.addTarget(self, action: #selector(updateInfo), for: .valueChanged)
        return table
    }()

    @objc func updateInfo() {
        infoTabelView.reloadData()
        infoTabelView.refreshControl?.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Информация"
        view.addSubview(infoTabelView)

        infoTabelView.dataSource = self
        infoTabelView.delegate = self
        
        infoTabelView.register(InfoViewCell.self, forCellReuseIdentifier: InfoViewCell.identifire)
        infoTabelView.register(InfoViewHeader.self, forHeaderFooterViewReuseIdentifier: InfoViewHeader.identifire)
        
        useConctraint()
    }
    
    func useConctraint(){
        NSLayoutConstraint.activate([
            infoTabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoTabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            infoTabelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoTabelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension InfoVC:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.identifire, for: indexPath) as? InfoViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: InfoViewHeader.identifire) as? InfoViewHeader else { return nil }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
