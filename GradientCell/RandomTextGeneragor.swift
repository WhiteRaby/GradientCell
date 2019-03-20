//
//  RandomTextGeneragor.swift
//  GradientCell
//
//  Created by Alex Golovaschenko on 3/20/19.
//  Copyright © 2019 Alex Golovaschenko. All rights reserved.
//

import Foundation

struct RandomTextGenerator {
    
    private static func randomWord() -> String {
        let length = arc4random() % 14 + 2
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    static func generate(minLength: UInt32 = 4, maxLength: UInt32 = 32) -> String {
        let length = arc4random() % (maxLength - minLength + 1) + minLength
        return (0..<length).reduce(String()) { prev, _ in prev + randomWord() + " " }
    }
}
