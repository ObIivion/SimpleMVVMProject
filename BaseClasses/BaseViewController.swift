//
//  BaseViewController.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    var mainView: T {view as! T}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = T()
    }
}
