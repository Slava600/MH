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
        label.font = UIFont(name: "SF-Pro-Text-Regular", size: 17)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textAlignment = .natural
        label.text = textInfo


//"""
//Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:
//
//1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.
//
//2. Выдержать 2 дня в прежнем состоянии самоконтроля.
//
//3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.
//
//4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.
//
//5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.
//
//"""
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
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    

}
