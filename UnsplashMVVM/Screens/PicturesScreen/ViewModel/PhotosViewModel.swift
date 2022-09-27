//
//  PhotosViewModel.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 27.09.2022.
//

import Foundation

class PhotosViewModel {
    
    private let provider = MoyaApiProvider()
    
    var reloadCollectionData: (() -> Void)?
    var photos: [PhotoStruct] = [] {
        didSet {
            reloadCollectionData?()
        }
    }
    
    func fetchPhotos() {
        provider.moyaGetPhotos { result in
            switch result {
            case let .success(photos):
                self.photos = photos
            case let .failure(error):
                print(error.asAFError?.errorDescription)
            }
        }
    }
}
