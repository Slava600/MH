//
//  HabitCollectionViewHeader.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 01.04.2022.
//

import UIKit

class HabitCollectionViewHeader: UICollectionViewCell {

// MARK: - Публичные свойства
    static let identifire = "HabitCollectionViewHeader"


// MARK: - Приватные свойства
    lazy private var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Сегодня"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()

// MARK: - Инициализаторы
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        useConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Приватные методы
    private func useConstraint(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ]
        )
    }
    

}
