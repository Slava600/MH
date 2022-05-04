//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 01.04.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {

// MARK: - Свойства
    static let identifire = "ProgressCollectionViewCell"

// MARK: - Приватные свойства
    lazy private var motivationLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Все получится!"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy private var procentLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy private var progressBar: UIProgressView = {
        let bar = UIProgressView(progressViewStyle: .bar)
        bar.toAutoLayout()
        bar.trackTintColor = .systemGray2
        bar.progressTintColor = СonstantValues.purpurColor
        bar.backgroundColor = .white
        bar.layer.cornerRadius = 8
        bar.clipsToBounds = true
        return bar
    }()

// MARK: - Инициализаторы
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(motivationLabel, procentLabel, progressBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Публичные методы
    func setup() {
        progressBar.progress = HabitsStore.shared.todayProgress
        procentLabel.text = String(Int(HabitsStore.shared.todayProgress*100)) + "%"
        useConstraint()
    }

// MARK: - Приватные методы
    private func useConstraint() {
        NSLayoutConstraint.activate([
            motivationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            motivationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            procentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            procentLabel.leadingAnchor.constraint(equalTo: motivationLabel.trailingAnchor, constant: 15),
            procentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            progressBar.topAnchor.constraint(equalTo: motivationLabel.bottomAnchor, constant: 8),
            progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            progressBar.heightAnchor.constraint(equalToConstant: 4)
        ]
        )
    }
}
