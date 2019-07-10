//
//  StringAdditions.swift
//  Hash
//
//  Created by Ross Butler on 7/10/19.
//

import Foundation

public extension String {
    
    enum Representation {
        case base64
        case encoded(using: String.Encoding)
        case hex
    }
    
    init?(hex: String, encoding: String.Encoding = .utf8) {
        guard let data = Data(hex: hex) else {
            return nil
        }
        self.init(data: data, encoding: encoding)
    }
    
}
