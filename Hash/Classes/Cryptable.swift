//
//  Cryptable.swift
//  Hash
//
//  Created by Ross Butler on 7/5/19.
//

import Foundation
import CommonCrypto

protocol Cryptable: class {
    
    var algorithm: Cipher { get }
    var ivData: Data { get }
    var keyData: Data { get }
    var message: Data { get }
    var result: CCCryptorStatus? { get set }
    
    func data() -> Data
    func data(operation: CCOperation) -> Data
    
}

extension Cryptable {
    
    func data(operation: CCOperation) -> Data {
        var outLength = Int(0)
        let inputData = message
        let length = (algorithm.blockSize() + inputData.count)
        var outputData = Data(count: length)
        var result: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
        _ = outputData.withUnsafeMutableBytes { outputBytes -> UInt8 in
            inputData.withUnsafeBytes { inputBytes -> UInt8 in
                ivData.withUnsafeBytes { ivBytes -> UInt8 in
                    keyData.withUnsafeBytes { keyBytes -> UInt8 in
                        let messageLength = size_t(outputBytes.count)
                        let keyLength = size_t(kCCKeySizeAES128)
                        if let keyBytes = keyBytes.bindMemory(to: UInt8.self).baseAddress,
                            let ivBytes = ivBytes.bindMemory(to: UInt8.self).baseAddress,
                            let inputBytes = inputBytes.bindMemory(to: UInt8.self).baseAddress,
                            let outputBytes = outputBytes.bindMemory(to: UInt8.self).baseAddress {
                            result = CCCrypt(operation, algorithm.ccAlgorithm(), CCOptions(kCCOptionPKCS7Padding),
                                             keyBytes, keyLength, ivBytes, inputBytes, inputData.count, outputBytes,
                                             messageLength, &outLength)
                        }
                        return 0
                        
                    }
                }
                
            }
            
        }
        self.result = result
        outputData.removeLast(outputData.count - outLength)
        return outputData
    }
    
}

