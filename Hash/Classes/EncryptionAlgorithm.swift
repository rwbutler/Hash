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
}

extension Cipher: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .aes128:
            return "AES-128"
        }
    }
    
}

extension Cipher {
    
    func blockSize() -> Int {
        switch self {
        case .aes128:
            return kCCBlockSizeAES128
        }
    }
    
    func ccAlgorithm() -> CCAlgorithm {
        switch self {
        case .aes128:
            return CCAlgorithm(kCCAlgorithmAES128)
        }
    }
    
}
