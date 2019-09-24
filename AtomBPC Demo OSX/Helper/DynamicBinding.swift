//
//  DynamicBinding.swift
//  WLA_RND_POC
//
//  Created by AtomBPC By Secure on 3/3/19.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation

public class Dynamic<T> {
    public typealias Listener = (T) -> Void
    public var listener: Listener?
    
    public func bind(listener: Listener?) {
        self.listener = listener
    }
    
    public func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ v: T) {
        value = v
    }
}
