//
//  ViewController.swift
//  ExampleProject
//
//  Created by Emrah Turan on 11.12.2023.
//

import UIKit
import ExampleFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Framework test
        Example.shared.test()
    }
}

