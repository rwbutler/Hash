//
//  HashAlgorithm.swift
//  Hash
//
//  Created by Ross Butler on 5/28/19.
//

import Foundation

/// Warning: MD2, MD4, MD5 or SHA-1 are known to be insecure - do not use for security purposes.
@objc public enum HashAlgorithm: Int {
    case md2
    case md4
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
}
