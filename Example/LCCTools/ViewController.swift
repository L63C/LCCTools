//
//  ViewController.swift
//  LCCTools
//
//  Created by lu63chuan on 04/07/2021.
//  Copyright (c) 2021 lu63chuan. All rights reserved.
//

import UIKit
import LCCTools

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let testVC = TestViewController.init()
        present(testVC, animated: true, completion: nil)
    }

}

