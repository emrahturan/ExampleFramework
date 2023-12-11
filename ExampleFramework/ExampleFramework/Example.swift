//
//  Example.swift
//  ExampleFramework
//
//  Created by Emrah Turan on 11.12.2023.
//

import Foundation

public class Example {
    public static let shared = Example()

    private init() {}
    
    public func test() {
        print("ExampleFramework / Example.swift / test()")
    }
}
