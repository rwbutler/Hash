//
//  DataAdditions.swift
//  Hash
//
//  Created by Ross Butler on 7/10/19.
//

import Foundation

public extension Data {
    
    init?(hex: String) {
        var data = Data(capacity: hex.count / 2)
        let regExStr = "[0-9a-f]{1,2}"
        guard let hexRegEx = try? NSRegularExpression(pattern: regExStr, options: .caseInsensitive) else {
            return nil
        }
        let entireStringRange = NSRange(hex.startIndex..., in: hex)
        hexRegEx.enumerateMatches(in: hex, range: entireStringRange) { match, _, _ in
            guard let range = match?.range else { return }
            let byteString = (hex as NSString).substring(with: range)
            if let byte = UInt8(byteString, radix: 16) {
                data.append(byte)
            }
        }
        guard !data.isEmpty else {
            return nil
        }
        self = data
    }
    
}

extension Data: StringRepresentable {
    
    public func data() -> Data {
        self
    }
    
}
