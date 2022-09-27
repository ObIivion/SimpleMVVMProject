//
//  Observable.swift
//  UnsplashMVVM
//
//  Created by Павел Виноградов on 23.09.2022.
//

class Observable<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(observer: Listener?) {
        self.listener = observer
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
}
