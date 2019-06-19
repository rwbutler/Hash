//
//  HashAlgorithm.swift
//  Hash
//
//  Created by Ross Butler on 5/28/19.
//

import Foundation

/// Warning: MD2, MD4, MD5 or SHA-1 are known to be insecure - do not use for security purposes.
@objc public enum HashAlgorithm: Int, CaseIterable {
    case md2
    case md4
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
}

extension HashAlgorithm: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .md2:
            return "MD2"
        case .md4:
            return "MD4"
        case .md5:
            return "MD5"
        case .sha1:
            return "SHA-1"
        case .sha224:
            return "SHA-224"
        case .sha256:
            return "SHA-256"
        case .sha384:
            return "SHA-384"
        case .sha512:
            return "SHA-512"
        }
    }
    
}
