//
//  TabBarVC.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 11/06/2022.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        self.title = "Cities"
        
        setupVCs()
    }
    
    // Methods
    
    func setupVCs() {
        viewControllers = [
            createVC(for: CitiesVC(), title: NSLocalizedString("City", comment: ""), image: UIImage()),
        ]
    }

    fileprivate func createVC(for vc: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        vc.navigationItem.title = title
        return vc
    }
}
