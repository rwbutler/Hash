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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

