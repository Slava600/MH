//
//  InfoViewHeader.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 26.03.2022.
//

import UIKit

class InfoViewHeader: UITableViewHeaderFooterView {
    
    static let identifire = "infoViewHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Привычка за 21 день"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        useConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConstraint(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
