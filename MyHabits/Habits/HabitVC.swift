//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 25.03.2022.
//

import UIKit

class HabitVC: UIViewController {
    
    var habit:Habit?
    var habitName = ""
    var habitTime = Date(){
        didSet{
            let dateformat = DateFormatter()
            dateformat.dateFormat = "HH:mm a"
        }
    }
    
    
    var habitColor: UIColor = .systemBlue {
        didSet {
            habitNameText.textColor = habitColor
//            dateValue.textColor = habitColor
            colorButton.backgroundColor = habitColor
        }
    }
    

    lazy var habitNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Название"
        return label
    }()
    
    lazy var habitNameText: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.backgroundColor = .yellow
        text.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        text.textColor = habitColor
        text.returnKeyType = .done
//        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
//        text.addTarget(self, action: #selector(nameTextChanged), for: .editingChanged)
//        text.autocapitalizationType = .none
//        text.delegate = self
        return text
        
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Цвет"
        return label
    }()
    
    lazy var colorButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = habitColor
        button.layer.cornerRadius = 15
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector (toColorButton), for: .touchUpInside)
        return button
    }()
    
    @objc func toColorButton(){
        let colorPicker = UIColorPickerViewController()
        
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameText)
        view.addSubview(colorLabel)
        view.addSubview(colorButton)
        
        useConstraint()
    
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([
            
            
            habitNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            habitNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            habitNameText.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 10),
            habitNameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            habitNameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            colorLabel.topAnchor.constraint(equalTo: habitNameText.bottomAnchor, constant: 10),
            colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            colorButton.topAnchor
        
        
        
        ])
        
    }
    

}
