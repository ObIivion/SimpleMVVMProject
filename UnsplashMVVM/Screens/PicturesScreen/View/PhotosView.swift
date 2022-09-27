//
//  PicturesView.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit

class PhotosView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Unsplash photos"
        label.textColor = .black
        return label
    }()
    
    let picturesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.decelerationRate = .normal
        return collection
    }()

    override func initSetup() {
        
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(picturesCollection)
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        picturesCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picturesCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            picturesCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            picturesCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            picturesCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
    }

}
