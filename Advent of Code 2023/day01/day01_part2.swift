//
//  day01_part2.swift
//  Advent of Code 2023
//
//  Created by Jake Martin on 12/1/23.
//

import Foundation

func day01_part2() {
    
    let directPuzzleInput = getInput(filename: "day01/day01_part02_testInput.txt")
    
    let puzzleInput = directPuzzleInput.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
    
//    print(puzzleInput)
    
    var fixedPuzzleInput: [String] = []
    
    //FIND AND REPLACE NUMBERS IN EACH LINE
    puzzleInput.forEach { line in
        fixedPuzzleInput.append(findNumbers(line: line))
    }
    
//    print("fixed: \(fixedPuzzleInput)")
    
    var values: [Int] = []
    
    //FIND FIRST AND LAST DIGIT
    for line in fixedPuzzleInput {
        var foundInts = ""
        for char in line {
            if char.isNumber {
                foundInts.append(char)
            }
        }
        
        if foundInts.count == 1 {
            foundInts.append(foundInts)
        }
        
        let currentPair = "\(foundInts.first!)\(foundInts.last!)"
        
//        print(currentPair)
        values.append(Int(currentPair)!)
    }
    print(values)
    print(values.reduce(0, +))
    
}

// REPLACED SPELLED OUT NUMBERS WITH INTS
func findNumbers(line: String) -> String {
    let numbers = ["one": "1","two": "2","three": "3","four": "4","five": "5","six": "6","seven": "7","eight": "8","nine": "9"]
    var fixedLine = line
    
    var looping = true
    var characterCheck = 1
    
    while looping {
        numbers.forEach { word, number in
            if fixedLine[fixedLine.startIndex...fixedLine.index(fixedLine.startIndex, offsetBy: characterCheck)].contains(word) {
//                print("\(word) found in \(fixedLine[fixedLine.startIndex...fixedLine.index(fixedLine.startIndex, offsetBy: characterCheck)])!")
                fixedLine = fixedLine.replacingOccurrences(of: word, with: number)
                characterCheck = 1
            } else {
//                print("\(word) not found in \(fixedLine[fixedLine.startIndex...fixedLine.index(fixedLine.startIndex, offsetBy: characterCheck)])")
            }
        }
        if characterCheck == fixedLine.count - 1 {
            looping = false
        } else {
            characterCheck += 1
        }
    }
//    print("done")
    return fixedLine
}
