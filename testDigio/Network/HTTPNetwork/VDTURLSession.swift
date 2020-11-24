//
//  Result.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
