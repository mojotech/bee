//
//  Dictionary.swift
//  Bee
//
//  Created by Joel Hawksley on 7/6/15.
//  Copyright (c) 2015 MojoTech. All rights reserved.
//

import Foundation

let Dictionary = Set(split(String(contentsOfFile: NSBundle.mainBundle().pathForResource("words", ofType: "txt")!, encoding: NSUTF8StringEncoding, error: nil)!) {$0 == " "})