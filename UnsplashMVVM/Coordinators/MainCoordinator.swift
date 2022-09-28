//
//  MainCoordinator.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

protocol MainCoordinatorProtocol {
    
    var tabBarController: MainTabBarController { get set }
    var navController: UINavigationController { get set }
    func photoTaped(photoInfo: PhotoStruct)
}

class MainCoordinator: MainCoordinatorProtocol {
    
    var tabBarController: MainTabBarController
    var navController: UINavigationController
    
    init(navControllerWithRoot: UINavigationController, tabBarController: MainTabBarController){
        self.navController = navControllerWithRoot
        self.tabBarController = tabBarController
        
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.isHidden = true
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
    }
    
    func photoTaped(photoInfo: PhotoStruct) {
        let detailsVC = DetailsViewController()
        let detailsViewModel = DetailsViewModel(with: photoInfo)
        detailsVC.viewModel = detailsViewModel
        navController.pushViewController(detailsVC, animated: true)
    }
    
}
