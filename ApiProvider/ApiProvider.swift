//
//  ApiProvider.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

import Foundation
import Moya
import SwiftyJSON

class MoyaApiProvider {
    
    private let provider = MoyaProvider<UnsplashData>()
    
    func moyaGetPhotos(competion: @escaping (Result<[PhotoStruct],Error>) -> Void) {
        
        print("упали в provider get photos")
        getData(target: .getPhotos, completion: competion)
    }
}

extension MoyaApiProvider {
    
    private func getData<PhotoStruct: Codable>(target: UnsplashData, completion: @escaping (Result<[PhotoStruct], Error>) -> Void ) {
        
        provider.request(target) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    print("----- SUCCESS REQUEST -----")
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decoded = try decoder.decode([PhotoStruct].self, from: response.data)
                    completion(.success(decoded))
                } catch {
                    print("ERROR CATCHED while decode json")
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            case let .failure(error):
                print("Case let failure")
                print(error.localizedDescription)
            }
        }
    }
}
