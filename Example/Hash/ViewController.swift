//
//  ViewController.swift
//  Hash
//
//  Created by Ross Butler on 06/04/2019.
//  Copyright (c) 2019 Ross Butler. All rights reserved.
//

import UIKit
import Hash

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let messageDigest = Hash(message: "Hello World!", algorithm: .sha256) {
            print(messageDigest.string())
        }
        if let hmac = HMAC(message: "Hello World!", key: "123", algorithm: .sha1) {
            print(hmac.string())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

