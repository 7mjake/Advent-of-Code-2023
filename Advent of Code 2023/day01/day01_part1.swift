//
//  day1-part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation

func day01_part1() {
    
    let directPuzzleInput = getInput(filename: "day01/day01_realInput.txt")
    
    let puzzleInput = directPuzzleInput.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
        .map {$0.map {Character(extendedGraphemeClusterLiteral: $0)}}
    
    print(puzzleInput)
    
    var values: [Int] = []
    
    for line in puzzleInput {
        var currentPair = ""
        for char in line {
            if char.isNumber {
                if currentPair.count == 2 {
                    let indexToRemove = currentPair.index(currentPair.startIndex, offsetBy: 1)
                    currentPair.remove(at: indexToRemove)
                }
                currentPair.append(char)
            }
        }
        
        if currentPair.count == 1 {
            currentPair.append(currentPair)
        }
        
        print(currentPair)
        values.append(Int(currentPair)!)
    }
    print(values.reduce(0, +))
    
}
