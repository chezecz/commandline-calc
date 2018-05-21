//
//  main.swift
//  calc
//
//  Created by Andrei Maslennikov on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var input : String = ""
var buffer : String = ""
let unary : [String] = ["+", "-"]
let operators : [String] = ["x", "/", "%", "+", "-"]

for i in 1..<CommandLine.argc {
    input += CommandLine.arguments[Int(i)]
}

var expressionCalc : Array<String> = []
let letter : Character
for letter in input {
    if "0"..."9" ~= letter {
        buffer.append(letter)
    }
    else if unary.contains(String(letter)) && buffer == "" {
        buffer.append(letter)
    }
    else if operators.contains(String(letter)) {
        expressionCalc.append(buffer)
        expressionCalc.append(String(letter))
        buffer = ""
    }
}
expressionCalc.append(buffer)
var result : Int = 0
var i = 0

while expressionCalc.count != 1 {
    if expressionCalc.count == 1 {
        break
    }
    if i == expressionCalc.count - 1 {
        break
    }
    if operators.contains(expressionCalc[i]) {
        switch expressionCalc[i] {
        case "x":
            result = Int(expressionCalc[i-1])! * Int(expressionCalc[i+1])!
            expressionCalc[i] = String(result)
            expressionCalc.remove(at: i+1)
            expressionCalc.remove(at: i-1)
            i=0
        case "/":
            result = Int(expressionCalc[i-1])! / Int(expressionCalc[i+1])!
            expressionCalc[i] = String(result)
            expressionCalc.remove(at: i+1)
            expressionCalc.remove(at: i-1)
            i=0
        case "%":
            result = Int(expressionCalc[i-1])! % Int(expressionCalc[i+1])!
            expressionCalc[i] = String(result)
            expressionCalc.remove(at: i+1)
            expressionCalc.remove(at: i-1)
            i=0
        default:
            break
        }
    }
    i += 1
}
i = 0
while expressionCalc.count != 1 || i < expressionCalc.count {
    if expressionCalc.count == 1 {
        break
    }
    if i == expressionCalc.count - 1 {
        break
    }
    if operators.contains(expressionCalc[i]) {
        switch expressionCalc[i] {
        case "+":
            result = Int(expressionCalc[i-1])! + Int(expressionCalc[i+1])!
            expressionCalc[i] = String(result)
            expressionCalc.remove(at: i+1)
            expressionCalc.remove(at: i-1)
            i=0
        case "-":
            result = Int(expressionCalc[i-1])! - Int(expressionCalc[i+1])!
            expressionCalc[i] = String(result)
            expressionCalc.remove(at: i+1)
            expressionCalc.remove(at: i-1)
            i=0
        default:
            break
        }
    }
    i += 1
}
print(Int(expressionCalc[0])!)
