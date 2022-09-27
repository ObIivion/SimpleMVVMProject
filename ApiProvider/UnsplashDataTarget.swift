//
//  MoyaTarget.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

import Moya

enum UnsplashData {
    case getPhotos
}

extension UnsplashData: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getPhotos:
            return URL(string: "https://api.unsplash.com")!
        }
    }
    
    var path: String {
        switch self {
        case .getPhotos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPhotos:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getPhotos:
            return ["Accept-Version" : "v1", "Authorization": "Client-ID l9YqPfdUo_WkiHuB7soHRIE3KeIxMlKx98IH2bV0fv4"]
        }
    }
}
