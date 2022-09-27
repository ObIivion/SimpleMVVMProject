//
//  PhotoModel_3.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 26.09.2022.
//

import Foundation

struct PhotoStruct: Codable {
    let id: String
    let createdAt: String
    let describtion: String?
    let user: TheUser
    let urls: URLs
}

struct TheUser : Codable {
    let username : String?
    let name : String?
    let location : String?
}

struct URLs: Codable {
    let full: String
    let regular: String
    let small: String
}
