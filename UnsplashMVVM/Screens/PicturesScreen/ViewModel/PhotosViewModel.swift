//
//  PhotosViewModel.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 27.09.2022.
//

import Foundation

class PhotosViewModel {
    
    var provider = MoyaApiProvider()
    
    var photoInfo = Observable(value: [PhotoStruct]())
    
    func fetchPhotos() {
        provider.moyaGetPhotos { result in
            switch result {
            case let .success(photos):
                self.photoInfo = Observable(value: photos)
            case let .failure(error):
                print(error.asAFError?.errorDescription)
            }
        }
    }
}
