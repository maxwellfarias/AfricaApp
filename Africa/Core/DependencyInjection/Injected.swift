//
//  Injected.swift
//  Africa
//
//  Created by Maxwell Santos Farias on 06/01/24.
//

import Foundation
import CoreText

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T
    
    init(_ keyPath: KeyPath<InjectionResolver, T>) {
        self.wrappedValue = InjectionResolver.shared[keyPath: keyPath]
    }
}
