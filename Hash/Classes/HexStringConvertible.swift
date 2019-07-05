//
//  HexStringConvertible.swift
//  Hash
//
//  Created by Ross Butler on 7/5/19.
//

import Foundation

public protocol HexStringConvertible {
    func data() -> Data
    func string() -> String
}

extension HexStringConvertible {
    public func string() -> String {
        return data().map { String(format: "%02hhx", $0) }.joined()
    }
}
