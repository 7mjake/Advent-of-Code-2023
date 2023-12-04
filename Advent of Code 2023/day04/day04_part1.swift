//
//  day04_part1.swift
//  Advent of Code 2023
//
//  Created by Jake Martin on 12/4/23.
//

import Foundation

func day04_part1() {
    let directPuzzleInput = getInput(filename: "day04/day04_realInput.txt")
    
//    let puzzleInput = directPuzzleInput.components(separatedBy: "\n")
    var puzzleInput = directPuzzleInput.split(separator: "\n")
        .filter { !$0.isEmpty }
        .map { line ->  [[String]] in
            line.split(separator: "|").map { part -> [String] in
                part.trimmingCharacters(in: .whitespaces)
                    .split(separator: " ")
                    .map { String($0) }
            }
        }
    
    var totalPoints = 0

    for (x, _) in puzzleInput.enumerated() {
        var winningNumbers: [Int] = []
        var cardPoints = 0
        puzzleInput[x][0].removeFirst(2)
        
        puzzleInput[x][0].forEach { num in
            if puzzleInput[x][1].contains(num) {
                winningNumbers.append(Int(num)!)
            }
        }
        cardPoints = Int(1 * pow(2, Double(winningNumbers.count) - 1))
        totalPoints = totalPoints + cardPoints
//        print(cardPoints)
//        print("Winning Numbers: \(winningNumbers)")
    }
    
    print(totalPoints)
}
