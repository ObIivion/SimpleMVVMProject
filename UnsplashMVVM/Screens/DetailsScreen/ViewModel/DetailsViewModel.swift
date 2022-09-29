//
//  DetailsViewModel.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 28.09.2022.
//

import Foundation

class DetailsViewModel {
    
    var observablePhoto = Observable(value: PhotoStruct.init(id: "", createdAt: "", describtion: "", user: TheUser.init(username: "", name: "", location: ""), urls: URLs.init(full: "", regular: "", small: "")))
    
    init(with photoInfo: PhotoStruct) {
        observablePhoto.value = photoInfo
        print(observablePhoto.value.createdAt)
    }
}
