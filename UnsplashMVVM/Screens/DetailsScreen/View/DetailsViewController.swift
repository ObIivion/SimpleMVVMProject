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
        
        print("check view model")
        print(viewModel.observablePhoto.value.user.location)
        bindViewModel()
    }
    
    func bindViewModel() {
        self.viewModel.observablePhoto.bind(listener: { photo in
            print("details view model")
            self.mainView.setModel(photo: photo)
        })
    }
}
