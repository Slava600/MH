//
//  HabitDetailsTableHeader.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 05.04.2022.
//

import UIKit

class HabitDetailsTableHeader: UITableViewHeaderFooterView {
    // MARK: - Свойства
    static let identifire = "HabitDetailsTableHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .systemGray2
        label.text = "Активность"
        return label
    }()

    // MARK: - Инициализаторы
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        useConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Приватные методы
    private func useConstraint(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
    }
}
