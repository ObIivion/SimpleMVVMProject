//
//  FavouritesVC.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

class FavouritesViewController: BaseViewController<FavouritesView> {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .darkGray
    }
  
}
