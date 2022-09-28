//
//  MainTabBarController.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapBar()
        setupTapBarAppearence()
    }
    
    private func setupTapBar() {
        
        viewControllers = [setupVC(viewController: PhotosViewController(),
                                   title: "Photos",
                                   image: UIImage(systemName: "house")),
                           setupVC(viewController: FavouritesViewController(),
                                   title: "Favourites",
                                   image: UIImage(systemName: "bookmark.circle.fill"))]
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
    
    private func setupTapBarAppearence() {
        
        let positionX: CGFloat = 10
        let positionY: CGFloat = 14
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY, width: width, height: height),
                                      cornerRadius: height/2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 2
        tabBar.itemPositioning = .centered
        
        tabBar.unselectedItemTintColor = UIColor.unselectedTabItemColor
        tabBar.tintColor = UIColor.selectedTabItemColor
        roundLayer.fillColor = UIColor.mainTabBarColor.cgColor
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        <#code#>
    }
}
