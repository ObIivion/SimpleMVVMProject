//
//  ViewController.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 22.09.2022.
//

import UIKit
import Kingfisher

class PhotosViewController: BaseViewController<PhotosView> {
    
    private lazy var viewModel = PhotosViewModel()
    
    private let apiProvider = MoyaApiProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.picturesCollection.delegate = self
        mainView.picturesCollection.register(PhotosCollectionViewCell.self,
                                             forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        mainView.picturesCollection.dataSource = self
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        print("bindViewModel")
        viewModel.fetchPhotos()
        viewModel.reloadCollectionData = { [weak self] in
            self?.mainView.picturesCollection.reloadData()
        }
    }
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                      for: indexPath) as! PhotosCollectionViewCell
        cell.setImage(url: viewModel.photos[indexPath.row].urls.regular)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                      for: indexPath) as! PhotosCollectionViewCell
        cell.setImage(url: viewModel.photos[indexPath.row].urls.full)
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(UIScreen.main.bounds.width / 2.1), height: CGFloat(UIScreen.main.bounds.width / 2.1))
    }
}

