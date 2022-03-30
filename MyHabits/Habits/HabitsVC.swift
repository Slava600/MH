//
//  HabitsVC.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 25.03.2022.
//

import UIKit

class HabitsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize:17))?
                .withTintColor(UIColor(named: "purple")!,renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addHabit))
        navigationItem.rightBarButtonItem = barButtonItem

    }
    @objc func addHabit() {
        let habitViewController = HabitVC()
        navigationController?.present(habitViewController, animated: true, completion: nil)
    }

}
