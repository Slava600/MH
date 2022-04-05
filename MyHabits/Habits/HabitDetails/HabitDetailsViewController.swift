//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 04.04.2022.
//

import UIKit

class HabitDetailsVC: UIViewController {
    
    static let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.toAutoLayout()
        table.isScrollEnabled = true
        table.separatorInset = .zero
        table.rowHeight = UITableView.automaticDimension
        table.refreshControl = UIRefreshControl()
        table.refreshControl?.addTarget(HabitDetailsVC.self, action: #selector(updateTable), for: .valueChanged)
        return table
    }()

    @objc func updateTable(){
        HabitDetailsVC.tableView.reloadData()
        HabitDetailsVC.tableView.refreshControl?.endRefreshing()
    }
    
//    static var isDeleted = false
    
    let habit: Habit
    
    init (_ habit: Habit) {
//        HabitDetailsViewController.isDeleted = false
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let leftBarButtonItem = UIBarButtonItem(title: "❮  Назад", style: .plain, target: self, action: #selector(tapToCancel))
        leftBarButtonItem.tintColor = СonstantValues.purpurColor
        navigationItem.leftBarButtonItem = leftBarButtonItem

        let rightBarButtonItem = UIBarButtonItem (title: "Править", style: .plain, target: self, action: #selector (editHabit))
        rightBarButtonItem.tintColor = СonstantValues.purpurColor
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.backgroundColor = .white
        
        HabitDetailsVC.tableView.dataSource = self
        HabitDetailsVC.tableView.delegate = self
        
        HabitDetailsVC.tableView.register(HabitDetailsTableHeader.self, forHeaderFooterViewReuseIdentifier: HabitDetailsTableHeader.identifire)
        HabitDetailsVC.tableView.register(HabitDetailTableViewCell.self, forCellReuseIdentifier: HabitDetailTableViewCell.identifire)

        view.addSubview(HabitDetailsVC.tableView)
        
        NSLayoutConstraint.activate([
            HabitDetailsVC.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            HabitDetailsVC.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            HabitDetailsVC.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            HabitDetailsVC.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    @objc func tapToCancel() {
        navigationController?.popViewController(animated: true)
    }

    @objc func editHabit(){
//        navigationController?.present(HabitVC(habit), animated: true, completion: nil)
    }
}

extension HabitDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitDetailTableViewCell.identifire, for: indexPath) as? HabitDetailTableViewCell else { return UITableViewCell()}
        
        let date = HabitsStore.shared.dates[indexPath.row]
        cell.setup(date: date, check: HabitsStore.shared.habit(habit, isTrackedIn: date))
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    HabitsStore.shared.dates.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HabitDetailsTableHeader.identifire) as? HabitDetailsTableHeader else { return nil }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
        
    }

}
    
