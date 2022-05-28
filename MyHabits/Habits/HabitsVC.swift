//
//  HabitsVC.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 25.03.2022.
//

import UIKit

class HabitsVC: UIViewController {

// MARK: - Публичные свойства

    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.toAutoLayout()
        collectionView.backgroundColor = СonstantValues.foneColor
        return collectionView
    }()

// MARK: - Методы жизенного цикла
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize:17))?
                .withTintColor(СonstantValues.purpurColor,renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addHabit))
        navigationItem.rightBarButtonItem = barButtonItem
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubviews(collectionView)
        
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifire)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifire)
        collectionView.register(HabitCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HabitCollectionViewHeader.identifire)

        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
        
        useConstraint()
    }

// MARK: - Публичные методы

    @objc func reloadTable(){
        self.collectionView.reloadData()
    }

    @objc func addHabit() {
        navigationController?.present(HabitVC(nil), animated: true, completion: nil)
    }
    
    func useConstraint(){
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Расширения
extension HabitsVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifire, for: indexPath) as? ProgressCollectionViewCell else {
                return UICollectionViewCell()}
            cell.setup()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifire, for: indexPath) as? HabitCollectionViewCell else {
                return UICollectionViewCell()}
            cell.setup(habit: HabitsStore.shared.habits[indexPath.item - 1])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HabitCollectionViewHeader.identifire, for: indexPath) as? HabitCollectionViewHeader else {
            return UICollectionReusableView()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width - 32, height: 60)
        } else {
            return CGSize(width: collectionView.frame.width - 32, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !(indexPath.item == 0) {
            guard let item = collectionView.cellForItem(at: indexPath) as? HabitCollectionViewCell else { return }
            
            if let habit = item.habit {
                navigationController?.pushViewController(HabitDetailsVC(habit), animated: true)
            }
        }
    }
}

