//
//  Hash.swift
//  Hash
//
//  Created by Ross Butler on 5/28/19.
//

import Foundation
import CommonCrypto

public typealias MessageDigest = Hash

@objcMembers public class Hash: NSObject, StringRepresentable {
    
    public typealias Algorithm = HashAlgorithm
    
    private let algorithm: Algorithm
    private let message: Data
    
    public init(message: Data, algorithm: Algorithm) {
        self.message = message
        self.algorithm = algorithm
    }
    
    public init?(message: String, encoding: String.Encoding = .utf8, algorithm: Algorithm) {
        guard let messageData = message.data(using: encoding) else {
            return nil
        }
        self.message = messageData
        self.algorithm = algorithm
    }
    
    public func data() -> Data {
        let data = message
        let length = algorithm.digestLength()
        var digestData = Data(count: length)
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            data.withUnsafeBytes { messageBytes -> UInt8 in
                if let baseAddress = messageBytes.baseAddress, let digestBytes = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(data.count)
                    switch algorithm {
                    case .md2:
                        CC_MD2(baseAddress, messageLength, digestBytes)
                    case .md4:
                        CC_MD4(baseAddress, messageLength, digestBytes)
                    case .md5:
                        CC_MD5(baseAddress, messageLength, digestBytes)
                    case .sha1:
                        CC_SHA1(baseAddress, messageLength, digestBytes)
                    case .sha224:
                        CC_SHA224(baseAddress, messageLength, digestBytes)
                    case .sha256:
                        CC_SHA256(baseAddress, messageLength, digestBytes)
                    case .sha384:
                        CC_SHA384(baseAddress, messageLength, digestBytes)
                    case .sha512:
                        CC_SHA512(baseAddress, messageLength, digestBytes)
                    }
                }
                return 0
            }
        }
        return digestData
    }
    
    override public var description: String {
        return string(representation: .hex)
    }
    
}
