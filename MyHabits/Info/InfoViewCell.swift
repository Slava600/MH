//
//  InfoViewCell.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 26.03.2022.
//

import UIKit

class InfoViewCell: UITableViewCell {
    
    static let identifire = "InfoViewCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textAlignment = .natural
        label.text = textInfo
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(label)
        useConctraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConctraint(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
