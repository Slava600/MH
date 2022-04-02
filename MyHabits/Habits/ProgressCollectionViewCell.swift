//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 01.04.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    static let identifire = "ProgressCollectionViewCell"
    
    lazy var motivationLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Все получится!"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy var procentLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.backgroundColor = .green
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
    lazy var progressBar: UIProgressView = {
        let bar = UIProgressView(progressViewStyle: .bar)
        bar.toAutoLayout()
        bar.trackTintColor = .systemGray2
        bar.backgroundColor = .white
        bar.layer.cornerRadius = 8
        bar.clipsToBounds = true
        bar.layer.sublayers![1].cornerRadius = 2.7
        bar.subviews[1].clipsToBounds = true
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(motivationLabel, procentLabel, progressBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        progressBar.progress = HabitsStore.shared.todayProgress
        procentLabel.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
        useConstraint()
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([
            motivationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            motivationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            procentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            procentLabel.leadingAnchor.constraint(equalTo: motivationLabel.trailingAnchor, constant: 16),
            procentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            
            progressBar.topAnchor.constraint(equalTo: motivationLabel.bottomAnchor, constant: 8),
            progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            progressBar.heightAnchor.constraint(equalToConstant: 8 * 0.5)
        ])
    }
}
