//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 04.04.2022.
//

import UIKit

class HabitDetailsVC: UIViewController {

// MARK: - Приватные свойства
    private let habit: Habit
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.toAutoLayout()
        table.isScrollEnabled = true
        table.separatorInset = .zero
        table.rowHeight = UITableView.automaticDimension
        table.refreshControl = UIRefreshControl()
        table.refreshControl?.addTarget(HabitDetailsVC.self, action: #selector(updateTable), for: .valueChanged)
        return table
    }()

// MARK: - Инициализаторы
    init(_ habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Методы жизненного цикла
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarButtonItem = UIBarButtonItem(title: "❮  Назад", style: .plain, target: self, action: #selector(tapToCancel))
        leftBarButtonItem.tintColor = СonstantValues.purpurColor
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editHabit))
        rightBarButtonItem.tintColor = СonstantValues.purpurColor
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(HabitDetailsTableHeader.self, forHeaderFooterViewReuseIdentifier: HabitDetailsTableHeader.identifire)
        tableView.register(HabitDetailTableViewCell.self, forCellReuseIdentifier: HabitDetailTableViewCell.identifire)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        )
    }

// MARK: - Публичные методы
    @objc func updateTable(){
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

    @objc func tapToCancel() {
        navigationController?.popViewController(animated: true)
    }

    @objc func editHabit(){
        navigationController?.present(HabitVC(habit), animated: true, completion: nil)
    }
}

// MARK: - Расширения
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

