//
//  EncryptedData.swift
//  Hash
//
//  Created by Ross Butler on 7/4/19.
//

import Foundation
import CommonCrypto

public typealias CipherText = EncryptedData

public class EncryptedData: NSObject, Cryptable, StringRepresentable {

    // MARK: - Type definitions
    public typealias Algorithm = EncryptionAlgorithm

    internal let algorithm: Algorithm
    internal let ivData: Data?
    internal let keyData: Data
    internal let message: Data
    
    /// Result of the previous encrypt / decrypt operation.
    public var result: CCCryptorStatus?
    
    public init(message: Data, key: Data, iv: Data? = nil, algorithm: Algorithm) {
        self.algorithm = algorithm
        self.ivData = iv
        self.keyData = key
        self.message = message
    }
    
    public init?(message: String, key: String, iv: String? = nil, encoding: String.Encoding = .utf8, algorithm: Algorithm) {
        guard let keyData = key.data(using: encoding), let messageData = message.data(using: encoding) else {
            return nil
        }
        self.algorithm = algorithm
        self.ivData = iv?.data(using: encoding)
        self.keyData = keyData
        self.message = messageData
    }
    
    public func data() -> Data {
        return data(operation: CCOperation(kCCEncrypt))
    }
    
    override public var description: String {
        return string(representation: .hex)
    }
    
}
