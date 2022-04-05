//
//  HabitsVC.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 25.03.2022.
//

import UIKit

class HabitsVC: UIViewController {
    
    static let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 21
        layout.sectionInsetReference = .fromContentInset
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return layout
    }()
    
    static let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: HabitsVC.layout)
        collectionView.toAutoLayout()
        collectionView.backgroundColor = СonstantValues.foneColor
        return collectionView
    }()
    
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
        
        HabitsVC.collectionView.dataSource = self
        HabitsVC.collectionView.delegate = self
        
        view.addSubviews(HabitsVC.collectionView)
        
        HabitsVC.collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifire)
        HabitsVC.collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifire)
        HabitsVC.collectionView.register(HabitCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HabitCollectionViewHeader.identifire)
    
        useConstraint()
    }
    
    @objc func addHabit() {
        navigationController?.present(HabitVC(nil), animated: true, completion: nil)
    }
    
    func useConstraint(){
        NSLayoutConstraint.activate([
            HabitsVC.collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            HabitsVC.collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            HabitsVC.collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            HabitsVC.collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifire , for: indexPath) as? HabitCollectionViewCell else {
                return UICollectionViewCell()}
            cell.setup(habit: HabitsStore.shared.habits[indexPath.item - 1])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HabitCollectionViewHeader.identifire, for: indexPath) as? HabitCollectionViewHeader else {
            return UICollectionReusableView ()}
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
