//
//  PhotosViewModel.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 27.09.2022.
//

import Foundation

class PhotosViewModel {
    
    private let provider = MoyaApiProvider()
    
    //var photoInfo = Observable(value: [PhotoStruct]())
    
    var photos: [PhotoStruct] = [] {
        didSet {
            reloadCollectionData?()
        }
    }
    
    var reloadCollectionData: (() -> Void)?
    
    
    func fetchPhotos() {
        provider.moyaGetPhotos { result in
            switch result {
            case let .success(photos):
                //self.photoInfo = Observable(value: photos)
                self.photos = photos
            case let .failure(error):
                print(error.asAFError?.errorDescription)
            }
        }
    }
}
