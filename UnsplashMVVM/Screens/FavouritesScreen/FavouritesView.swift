//
//  FavouritesView.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

class FavouritesView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo details info"
        label.textColor = .black
        return label
    }()

    override func initSetup() {
        addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30)
        ])   
    }
}
