//
//  Observable.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

class Observable<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(listener: Listener?) {
        print("bind listener")
        self.listener = listener
    }
    
    var value: T {
        didSet {
            print("did set")
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
}
