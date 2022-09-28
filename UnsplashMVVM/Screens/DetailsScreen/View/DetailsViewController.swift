//
//  DetailsViewController.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

import UIKit

class DetailsViewController: BaseViewController<DetailsView> {
    
    var viewModel: DetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel(){
        viewModel.observablePhoto.bind(observer: { photo in
            self.mainView.setModel(photo)
        })
    }
}
