//
//  day03_part1.swift
//  Advent of Code 2023
//
//  Created by Jake Martin on 12/3/23.
//

import Foundation

func day03_part1() {
    
    let directPuzzleInput = getInput(filename: "day03/day03_realInput.txt")
    
    let puzzleInput = directPuzzleInput.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
        .map { Array($0) }
    
    var partNumbers: [Int] = []
    
    for (y, line) in puzzleInput.enumerated() {
        
//        print(line)
//        print("line count: \(puzzleInput[y].count)")
        
        var partNumber = ""
        var xBottom = -1
        var xTop = -1
        
        for (x, char) in line.enumerated() {
            
            if char.isNumber {
                partNumber.append(char)
                if xBottom == -1 {xBottom = x}
                if x+1 == puzzleInput[y].count {
                    xTop = x - 1
                    if checkPartNumber(y: y, xRange: xBottom...xTop, input: puzzleInput) {
                        print("is a part: \(partNumber) (line: \(y))")
                        partNumbers.append(Int(partNumber)!)
                    } else {
                        print("NOT A PART: \(partNumber) (line: \(y))")
                    }
                }
            } else if !char.isNumber {
                if !partNumber.isEmpty {
                    xTop = x - 1
                    if checkPartNumber(y: y, xRange: xBottom...xTop, input: puzzleInput) {
                        print("is a part: \(partNumber) (line: \(y))")
                        partNumbers.append(Int(partNumber)!)
                    } else {
                        print("NOT A PART: \(partNumber) (line: \(y))")
                    }
                }
                partNumber = ""
                xBottom = -1
                xTop = -1
            }
            
        }
    }
    
    print("FINAL: \(partNumbers.reduce(0, +))")
    
}

func checkPartNumber(y: Int, xRange: ClosedRange<Int>, input: [[String.Element]]) -> Bool {
    
    var isValid = false
    var yRange: ClosedRange<Int>
    var xRange = xRange.lowerBound-1...xRange.upperBound+1
    
//    print("y: \(y), input count: \(input.count)")
    
    if y == 0 {
        yRange = y...y+1
    } else if y == input.count-1 {
        yRange = y-1...y
    } else {
        yRange = y-1...y+1
    }
    
    if xRange.lowerBound == -1 {
        xRange = xRange.lowerBound+1...xRange.upperBound
    } else if xRange.upperBound == input[0].count {
        xRange = xRange.lowerBound...xRange.upperBound-1
    }
    
//    print("line \(y): \(xRange))")
    
    for line in yRange {
        for char in xRange {
            if !input[line][char].isNumber && input[line][char] != "." {
//                print("symbol found: \(input[line][char])")
                isValid = true
            }
        }
    }
    
    return isValid
}
