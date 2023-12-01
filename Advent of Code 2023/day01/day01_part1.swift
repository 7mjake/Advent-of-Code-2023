//
//  day1-part1.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/21/23.
//

import Foundation

func day01_part1() {
    
//    var directPuzzleInput: String? = nil // declaring puzzleInput here
//    
//    if let filePath = Bundle.main.path(forResource: "day01_testInput", ofType: "txt", inDirectory: "day01") {
//        do {
//            directPuzzleInput = try String(contentsOfFile: filePath, encoding: .utf8)
//        } catch {
//            print("Error: \(error)")
//        }
//    } else {
//        print("File path could not be found.")
//        return
//    }
    
    let directPuzzleInput = getInput(filename: "day01/day01_testInput.txt")

    
    let puzzleInput = directPuzzleInput.components(separatedBy: "\n\n").map {
        $0.components(separatedBy: "\n").compactMap { Int($0) }
    }
    
    print(puzzleInput)
    
    var mostCalsElf: Int = -1
    var mostCals = 0
    
    for (index, elf) in puzzleInput.enumerated() {
        
        var calTotal = 0
        for item in elf {
            calTotal = calTotal + item
        }
        print("elf #\(index + 1) has \(calTotal) calories")
        if calTotal > mostCals {
            mostCals = calTotal
            mostCalsElf = index + 1
        }
    }
    
    print("elf #\(mostCalsElf) has the most at \(mostCals) calories")
    
}
