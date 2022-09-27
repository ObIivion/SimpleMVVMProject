//
//  PhotosCollectionViewCell.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

import UIKit
import Kingfisher

class PhotosCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier = "photoCellIdentifier"
    
    private let photo: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }()
    
    override func initSetup() {
        addSubview(photo)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    func setImage(url: String) {
        if let url = URL(string: url) {
            photo.kf.setImage(with: url)
        }
    }
}
