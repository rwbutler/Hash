//
//  HashAlgorithm+ExpectedString.swift
//  Hash_Example
//
//  Created by Ross Butler on 6/19/19.
//  Copyright © 2019 Ross Butler. All rights reserved.
//

import Foundation
import Hash

extension HashAlgorithm {
    
    /// The expected hex string for 'Hello World!'
    var expectedString: String {
        switch self {
        case .md2:
            return "315f7c67223f01fb7cab4b95100e872e"
        case .md4:
            return "b2a5cc34fc21a764ae2fad94d56fadf6"
        case .md5:
            return "ed076287532e86365e841e92bfc50d8c"
        case .sha1:
            return "2ef7bde608ce5404e97d5f042f95f89f1c232871"
        case .sha224:
            return "4575bb4ec129df6380cedde6d71217fe0536f8ffc4e18bca530a7a1b"
        case .sha256:
            return "7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069"
        case .sha384:
            return "bfd76c0ebbd006fee583410547c1887b0292be76d582d96c242d2a792723e3fd6fd061f9d5cfd13b8f961358e6adba4a"
        case .sha512:
            return "861844d6704e8573fec34d967e20bcfef3d424cf48be04e6dc08f2bd58c729743371015ead891cc3cf1c9d34b49264b510751b1ff9e537937bc46b5d6ff4ecc8"
        }
    }
    
}
