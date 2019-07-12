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
    case blowfish
    case cast
    case des
    case rc2
    case rc4
    case tripleDES
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
        case .blowfish:
            return "Blowfish"
        case .cast:
            return "CAST"
        case .des:
            return "DES"
        case .rc2:
            return "RC2"
        case .rc4:
            return "RC4"
        case .tripleDES:
            return "3DES"
        }
    }
    
}

extension Cipher {
    
    func blockSize() -> Int {
        switch self {
        case .aes128, .aes192, .aes256:
            return kCCBlockSizeAES128
        case .blowfish:
            return kCCBlockSizeBlowfish
        case .cast:
            return kCCBlockSizeCAST
        case .des:
            return kCCBlockSizeDES
        case .rc2:
            return kCCBlockSizeRC2
        case .rc4:
            return 0
        case .tripleDES:
            return kCCBlockSize3DES
        }
    }
    
    func ccAlgorithm() -> CCAlgorithm {
        switch self {
        case .aes128, .aes192, .aes256:
            return CCAlgorithm(kCCAlgorithmAES)
        case .blowfish:
            return CCAlgorithm(kCCAlgorithmBlowfish)
        case .cast:
            return CCAlgorithm(kCCAlgorithmCAST)
        case .des:
            return CCAlgorithm(kCCAlgorithmDES)
        case .rc2:
            return CCAlgorithm(kCCAlgorithmRC2)
        case .rc4:
            return CCAlgorithm(kCCAlgorithmRC4)
        case .tripleDES:
            return CCAlgorithm(kCCAlgorithm3DES)
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
        case .blowfish:
            return kCCKeySizeMinBlowfish
        case .cast:
            return kCCKeySizeMinCAST
        case .des:
            return kCCKeySizeDES
        case .rc2:
            return kCCKeySizeMinRC2
        case .rc4:
            return kCCKeySizeMinRC4
        case .tripleDES:
            return kCCKeySize3DES
        }
    }
    
}

