//
//  InfoViewCell.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 26.03.2022.
//

import UIKit

class InfoViewCell: UITableViewCell {
    // MARK: - Публичные свойства
    static let identifire = "InfoViewCell"

    // MARK: - Приватные свойства
    private lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textAlignment = .natural
        label.text = textInfo
        return label
    }()

    // MARK: - Инфициализаторы
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        useConctraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Приватные методы
    private func useConctraint(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
