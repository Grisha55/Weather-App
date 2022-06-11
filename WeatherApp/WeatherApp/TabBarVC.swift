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
        self.title = "Weather"
        
        setupVCs()
    }
    
    // Methods
    
    func setupVCs() {
        viewControllers = [
            WeatherDataVC()
        ]
    }

}
