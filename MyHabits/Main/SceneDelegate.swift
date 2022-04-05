//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Архипов Вячеслав on 24.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    internal var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        
        let habitsVC = HabitsVC()
        habitsVC.view.backgroundColor = UIColor.white
        let habitsNavVC = UINavigationController(rootViewController: habitsVC)
        habitsNavVC.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "tabIconHabits"), selectedImage: UIImage(named: "tabIconHabits"))
        habitsNavVC.navigationBar.barTintColor = UIColor.white

       
        let infoVC = InfoVC()
        infoVC.view.backgroundColor = UIColor.white
        let infoNavVC = UINavigationController(rootViewController: infoVC)
        infoNavVC.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle"), selectedImage: UIImage(systemName: "info.circle"))

        
        let tabBC = UITabBarController()
        tabBC.tabBar.backgroundColor = .white
        tabBC.viewControllers = [habitsNavVC, infoNavVC]
        
        
        let appearanceTabBar = tabBC.tabBar.standardAppearance
        appearanceTabBar.stackedLayoutAppearance.selected.titleTextAttributes = [ .foregroundColor: СonstantValues.purpurColor]
        appearanceTabBar.stackedLayoutAppearance.selected.iconColor = СonstantValues.purpurColor
        tabBC.tabBar.standardAppearance = appearanceTabBar
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        

//      let habitVC = HabitVC()
//      window.rootViewController = habitVC
        
        window.rootViewController = tabBC
        window.makeKeyAndVisible()
        
        self.window = window
    }

    
    
    
    
    
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

