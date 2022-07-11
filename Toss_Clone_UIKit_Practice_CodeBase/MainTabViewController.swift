//
//  ViewController.swift
//  Toss_Clone_UIKit_Practice_CodeBase
//
//  Created by 이창형 on 2022/07/01.
//

import UIKit

class MainTabViewController: UITabBarController {
    private lazy var homeViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: HomeViewController())
        let tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
        
    }()
    
    private lazy var benefitViewController: UIViewController = {
        let viewController = TossViewController()
        let tabBarItem = UITabBarItem(
            title: "혜택",
            image: UIImage(systemName: "diamond.fill"),
            tag: 1
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
        
    }()
    
    private lazy var sendMoneyViewController: UIViewController = {
        let viewController = TossViewController()
        let tabBarItem = UITabBarItem(
            title: "송금",
            image: UIImage(systemName: "bitcoinsign.circle.fill"),
            tag: 2
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
        
    }()
    
    private lazy var jusicViewController: UIViewController = {
        let viewController = TossViewController()
        let tabBarItem = UITabBarItem(
            title: "주식",
            image: UIImage(systemName: "hammer.fill"),
            tag: 3
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
        
    }()
    
    private lazy var allViewController: UIViewController = {
        let viewController = TossViewController()
        let tabBarItem = UITabBarItem(
            title: "전체",
            image: UIImage(systemName: "list.dash"),
            tag: 4
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTabBar()
        viewControllers = [homeViewController, benefitViewController, sendMoneyViewController, jusicViewController, allViewController]
    }
    
    func setupTabBar() {
        tabBar.layer.masksToBounds = true
        tabBar.barStyle = .default
        tabBar.layer.cornerRadius = 25
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.tintColor = .black
        tabBar.backgroundColor = .systemBackground
//        tabBar.layer.borderColor = UIColor.systemBackground.cgColor
        tabBar.layer.borderWidth = 0.2
    }
}
