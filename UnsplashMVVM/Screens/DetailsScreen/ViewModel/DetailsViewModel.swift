//
//  DetailsViewModel.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 28.09.2022.
//

import Foundation

class DetailsViewModel {
    
    var observablePhoto: Observable<PhotoStruct>
    
    init(with photoInfo: PhotoStruct) {
        self.observablePhoto = Observable(value: photoInfo)
        
    }
}
