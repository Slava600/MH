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
    
    lazy var habitNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Название"
        return label
    }()
    
    var habitColor: UIColor = .systemBlue {
        didSet {
            habitNameText.textColor = habitColor
            setTimeValue.textColor = habitColor
            colorButton.backgroundColor = habitColor
        }
    }
    
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
        colorPicker.selectedColor = habitColor
        colorPicker.delegate = self
        present(colorPicker, animated: true, completion: nil)
    }
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Время"
        return label
    }()
    
    lazy var everyDayInLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Каждый день в "
        return label
    }()
    
    var habitTime = Date(){
        didSet{
            let dateformat = DateFormatter()
            dateformat.dateFormat = "HH:mm a"
            setTimeValue.text = dateformat.string(from: habitTime)
        }
    }
    
    lazy var setTimeValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.toAutoLayout()
        label.textColor = habitColor
        label.numberOfLines = 1
        let dateformat = DateFormatter()
        dateformat.dateFormat = "HH:mm a"
        label.text = dateformat.string(from: habitTime)
        return label
    }()
    
    lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.toAutoLayout()
        timePicker.date = habitTime
        timePicker.backgroundColor = .white
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        return timePicker
    }()
    
    @objc func timeChanged(_ sender: UIDatePicker ){
        habitTime = sender.date
    }
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("Отменить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(UIColor(named: "purple"), for: .normal)
        button.addTarget(self, action: #selector(cancelHabit), for: .touchUpInside)
        return button
    }()
    
    @objc func cancelHabit(){
        dismiss(animated: true, completion: nil)
    }
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(UIColor(named: "purple"), for: .normal)
        button.addTarget(self, action: #selector(saveHabit), for: .touchUpInside)
        return button
    }()
    
    @objc func saveHabit(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameText)
        view.addSubview(colorLabel)
        view.addSubview(colorButton)
        view.addSubview(timeLabel)
        view.addSubview(everyDayInLabel)
        view.addSubview(setTimeValue)
        view.addSubview(timePicker)
        view.addSubview(cancelButton)
        
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
            
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 10),
            colorButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            everyDayInLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            everyDayInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            
            setTimeValue.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            setTimeValue.leadingAnchor.constraint(equalTo: everyDayInLabel.trailingAnchor, constant: 5),
            
            
            timePicker.topAnchor.constraint(equalTo: everyDayInLabel.bottomAnchor, constant: 10),
            timePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            timePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        ])
        
    }
    

}

extension HabitVC: UIColorPickerViewControllerDelegate, UITextFieldDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        habitColor = viewController.selectedColor
    }
}
