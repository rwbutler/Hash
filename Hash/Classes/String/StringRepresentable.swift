//
//  HexStringConvertible.swift
//  Hash
//
//  Created by Ross Butler on 7/5/19.
//

import Foundation

public protocol StringRepresentable {
    func data() -> Data
    func hexString() -> String
    func string(representation: String.Representation) -> String
}

extension StringRepresentable {
    
    /// Convenience method for obtaining hexadecimal Strings.
    public func hexString() -> String {
        return string(representation: .hex)
    }
    
    public func string(representation: String.Representation) -> String {
        switch representation {
        case .base64:
            return data().base64EncodedString()
        case .encoded(let encoding):
            return String(data: data(), encoding: encoding) ?? ""
        case .hex:
            return data().map { String(format: "%02hhx", $0) }.joined()
        }
    }
    
}
