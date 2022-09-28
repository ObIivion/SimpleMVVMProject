//
//  DetailsView.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

import UIKit

class DetailsView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo details info"
        label.textColor = .black
        return label
    }()
    
    private let photoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let authorName: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let createdAtLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let numberOfDowloads: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    override func initSetup() {
        addSubview(titleLabel)
        setupConstraints()
    }
    
    func setModel(photo) {
        
        
        
    }
    
    private func setupConstraints(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            photoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        authorName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorName.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 20),
            authorName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createdAtLabel.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 20),
            createdAtLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: createdAtLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
        
        numberOfDowloads.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfDowloads.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            numberOfDowloads.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
