//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 01.04.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {

// MARK: - Публичные свойства
    static let identifire = "HabitCollectionViewCell"
    var habit: Habit?

// MARK: - Приватные свойства
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var dataText: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy private var counterText: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy private var checker: UIButton = {
        let checkButton = UIButton()
        checkButton.toAutoLayout()
        checkButton.layer.cornerRadius = 19
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.addTarget(self, action: #selector(tapToChecker), for: .touchUpInside)
        return checkButton
    }()

// MARK: - Инициализаторы
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(nameLabel, dataText, counterText, checker)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Публичные методы
    @objc func tapToChecker() {
        if let trackHabit = habit {
            HabitsStore.shared.track(trackHabit)
            HabitsVC.collectionView.reloadData()
        }
    }

    func setup(habit: Habit) {
        self.habit = habit
        nameLabel.text = habit.name
        nameLabel.textColor = habit.color
        dataText.text = habit.dateString
        counterText.text = "Счётчик: " + String(habit.trackDates.count)
        
        if habit.isAlreadyTakenToday {
            checker.backgroundColor = habit.color
            checker.layer.borderWidth = 1
            checker.layer.borderColor = habit.color.cgColor
            checker.setTitle("✔︎", for: .normal)
            checker.isUserInteractionEnabled = false
        } else {
            checker.backgroundColor = .white
            checker.layer.borderWidth = 1
            checker.layer.borderColor = habit.color.cgColor
            checker.backgroundColor = .white
            checker.setTitle("", for: .normal)
            checker.isUserInteractionEnabled = true
        }
        useConstraint()
    }

// MARK: - Приватные методы
    private func useConstraint(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            dataText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dataText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            checker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checker.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 40),
            checker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            checker.widthAnchor.constraint(equalToConstant: 38),
            checker.heightAnchor.constraint(equalToConstant: 38),
            
            counterText.topAnchor.constraint(equalTo: checker.bottomAnchor, constant: 15),
            counterText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            counterText.trailingAnchor.constraint(equalTo: checker.leadingAnchor, constant: -40)
        ]
        )
    }
}
