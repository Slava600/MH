//
//  HabitsVC.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 25.03.2022.
//

import UIKit

class HabitsVC: UIViewController {
    
    static let leyout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 21
        layout.sectionInsetReference = .fromContentInset
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return layout
    }()
    
    static let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: HabitsVC.leyout)
        collection.toAutoLayout()
        collection.backgroundColor = UIColor(named: "purple")
        return collectionView
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize:17))?
                .withTintColor(UIColor(named: "purple")!,renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addHabit))
        navigationItem.rightBarButtonItem = barButtonItem
        
        HabitsVC.collectionView.dataSource = self
        HabitsVC.collectionView.delegate = self

        view.addSubviews(HabitsVC.collectionView)

        HabitsVC.collectionView.register(HabitCollectionViewHeader.self, forCellWithReuseIdentifier: HabitCollectionViewHeader.identifire)
        HabitsVC.collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifire)
        HabitsVC.collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifire)
        
        useConstraint()

    }
    
    func useConstraint(){
        NSLayoutConstraint.activate([
            HabitsVC.collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            HabitsVC.collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            HabitsVC.collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            HabitsVC.collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    @objc func addHabit() {
        let habitViewController = HabitVC()
        navigationController?.present(habitViewController, animated: true, completion: nil)
    }

}
