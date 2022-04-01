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
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 34)
        label.textColor = .black
        label.text = "Сегодня"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
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
