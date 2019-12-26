//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by zombietux on 2019/12/26.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayViewController = UIViewController()
        todayViewController.view.backgroundColor = .white
        todayViewController.navigationItem.title = "투데이"
        
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayNavController.tabBarItem.title = "투데이"
        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        todayNavController.navigationBar.prefersLargeTitles = true
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "앱"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "앱"
        redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewContoller = UIViewController()
        blueViewContoller.view.backgroundColor = .white
        blueViewContoller.navigationItem.title = "검색"
 
        let blueNavController = UINavigationController(rootViewController: blueViewContoller)
        blueNavController.tabBarItem.title = "검색"
        blueNavController.tabBarItem.image = UIImage(named: "search")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
            todayNavController,
            redNavController,
            blueNavController
        ]
    }
}
