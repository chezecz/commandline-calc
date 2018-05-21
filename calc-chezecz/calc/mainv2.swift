//
//  main.swift
//  calc
//
//  Created by Andrei Maslennikov on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

let operators : [String] = ["x", "/", "%", "+", "-"]

if CommandLine.argc == 3 {          //Hardcoding value for number of arguments. Consider this as "magic" value
    print("Not enough arguments")
    exit(2)
}

var expressionCalc : Array<String> = []
for i in 1..<CommandLine.argc {
    expressionCalc.append(CommandLine.arguments[Int(i)])
}

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
            if Int(expressionCalc[i+1]) == 0 {
                print("Divide by zero")
                exit(4)
            }
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
    else if Int(expressionCalc[i]) == nil {
        print("Not an operand")
        exit(3)
    }
    i += 1
}
print(Int(expressionCalc[0])!)


