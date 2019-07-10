//
//  HashAlgorithm.swift
//  Hash
//
//  Created by Ross Butler on 5/28/19.
//

import Foundation
import CommonCrypto

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

extension HashAlgorithm {
    
    func ccAlgorithm() -> CCHmacAlgorithm? {
        switch self {
        case .md2, .md4:
            return nil
        case .md5:
            return CCHmacAlgorithm(kCCHmacAlgMD5)
        case .sha1:
            return CCHmacAlgorithm(kCCHmacAlgSHA1)
        case .sha224:
            return CCHmacAlgorithm(kCCHmacAlgSHA224)
        case .sha256:
            return CCHmacAlgorithm(kCCHmacAlgSHA256)
        case .sha384:
            return CCHmacAlgorithm(kCCHmacAlgSHA384)
        case .sha512:
            return CCHmacAlgorithm(kCCHmacAlgSHA512)
        }
    }
    
    func digestLength() -> Int {
        switch self {
        case .md2:
            return Int(CC_MD2_DIGEST_LENGTH)
        case .md4:
            return Int(CC_MD4_DIGEST_LENGTH)
        case .md5:
            return Int(CC_MD5_DIGEST_LENGTH)
        case .sha1:
            return Int(CC_SHA1_DIGEST_LENGTH)
        case .sha224:
            return Int(CC_SHA224_DIGEST_LENGTH)
        case .sha256:
            return Int(CC_SHA256_DIGEST_LENGTH)
        case .sha384:
            return Int(CC_SHA384_DIGEST_LENGTH)
        case .sha512:
            return Int(CC_SHA512_DIGEST_LENGTH)
        }
    }
    
}
