//
//  MainCoordinator.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

protocol MainCoordinatorProtocol {
    
    var navController: UINavigationController { get set }
    var tabBarController: MainTabBarController { get set }
    func photoTaped(photoInfo: PhotoStruct)
}

class MainCoordinator: MainCoordinatorProtocol {
    
    var navController: UINavigationController
    var tabBarController: MainTabBarController
    
    init(navController: UINavigationController, tabBarController: MainTabBarController){
        self.navController = navController
        self.tabBarController = tabBarController
    }
    
    private func setupNavigationController() {
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.isHidden = false
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
    }
    
    func setupTabBarController() {
        setupNavigationController()
        tabBarController.coordinator = self
        tabBarController.setupTapBar()
    }
    
    func photoTaped(photoInfo: PhotoStruct) {
        print("Photo Taped Main coordinator")
        let detailsVC = DetailsViewController()
        let detailsViewModel = DetailsViewModel(with: photoInfo)
        detailsVC.viewModel = detailsViewModel
        navController.pushViewController(detailsVC, animated: true)
    }
    
}
