//
//  EncryptionAlgorithm.swift
//  Hash
//
//  Created by Ross Butler on 7/4/19.
//

import Foundation
import CommonCrypto

public typealias EncryptionAlgorithm = Cipher
public typealias DecryptionAlgorithm = Cipher

@objc public enum Cipher: Int, CaseIterable {
    case aes128
    case aes192
    case aes256
}

extension Cipher: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .aes128:
            return "AES-128"
        case .aes192:
            return "AES-192"
        case .aes256:
            return "AES-256"
        }
    }
    
}

extension Cipher {
    
    func blockSize() -> Int {
        switch self {
        case .aes128, .aes192, .aes256:
            return kCCBlockSizeAES128
        }
    }
    
    func ccAlgorithm() -> CCAlgorithm {
        switch self {
        case .aes128, .aes192, .aes256:
            return CCAlgorithm(kCCAlgorithmAES)
        }
    }
    
    func keySize() -> Int {
        switch self {
        case .aes128:
            return kCCKeySizeAES128
        case .aes192:
            return kCCKeySizeAES192
        case .aes256:
            return kCCKeySizeAES256
        }
    }
    
}
