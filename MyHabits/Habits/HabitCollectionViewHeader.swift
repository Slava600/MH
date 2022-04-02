//
//  HabitCollectionViewHeader.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 01.04.2022.
//

import UIKit

class HabitCollectionViewHeader: UICollectionViewCell {
    
    static let identifire = "HabitCollectionViewHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Сегодня"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        useConstraint()
    }
    
    func useConstraint(){
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                                     label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
