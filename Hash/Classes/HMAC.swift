//
//  HMAC.swift
//  Hash
//
//  Created by Ross Butler on 6/19/19.
//

import Foundation
import CommonCrypto

@objcMembers public class HMAC: NSObject, HexStringConvertible {
    
    public typealias Algorithm = HashAlgorithm
    
    private let key: String
    private let message: Data
    private let hashAlgorithm: Algorithm
    
    public init?(message: Data, key: String, algorithm: Algorithm) {
        guard algorithm.ccAlgorithm() != nil else {
            return nil
        }
        self.key = key
        self.message = message
        self.hashAlgorithm = algorithm
    }
    
    public init?(message: String, encoding: String.Encoding = .utf8, key: String, algorithm: Algorithm) {
        guard let messageData = message.data(using: encoding), algorithm.ccAlgorithm() != nil else {
            return nil
        }
        self.key = key
        self.message = messageData
        self.hashAlgorithm = algorithm
    }
    
    public func data() -> Data {
        let data = message
        let length = hashAlgorithm.digestLength()
        var digestData = Data(count: length)
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            data.withUnsafeBytes { messageBytes -> UInt8 in
                if let baseAddress = messageBytes.baseAddress, let digestBytes = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = size_t(messageBytes.count)
                    if let algorithm = hashAlgorithm.ccAlgorithm() {
                        CCHmac(algorithm, key, key.count, baseAddress, messageLength, digestBytes)
                    }
                }
                return 0
            }
        }
        return digestData
    }
    
    override public var description: String {
        return string()
    }
    
}
