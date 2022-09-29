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
        
        getData(target: .getPhotos, completion: competion)
    }
}

extension MoyaApiProvider {
    
    private func getData<PhotoStruct: Codable>(target: UnsplashData, completion: @escaping (Result<[PhotoStruct], Error>) -> Void ) {
        
        provider.request(target) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decoded = try decoder.decode([PhotoStruct].self, from: response.data)
                    completion(.success(decoded))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
