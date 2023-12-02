//
//  day02_part1.swift
//  Advent of Code 2023
//
//  Created by Jake Martin on 12/2/23.
//

import Foundation

struct Game {
    var gameNum: Int
    var rounds: [[String: Int]]
}

func day02_part1() {
    
    let directPuzzleInput = getInput(filename: "day02/day02_testInput.txt")
    
    let puzzleInput = directPuzzleInput.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
    //        .map {$0.components(separatedBy: "\n")}
    
//    print(puzzleInput[0])
    
    let parsedGames: [Game] = puzzleInput.map{ game in
//        print(parseGame(game: game))
        return parseGame(game: game)
    }
    
    print(parsedGames)
    
}

func parseGame(game: String) -> Game {
    
    //    var newGame = Game()
    
    let gameNum = Int(game.components(separatedBy: ": ")[0].components(separatedBy: " ")[1])!
    let rounds: [[String: Int]] = game.components(separatedBy: ": ")[1].components(separatedBy: "; ").map { part in
        //        print("part: \(part)")
        let draw: [String: Int] = part.components(separatedBy: ", ")
            .map { subPart -> (String, Int) in
                let subPartHalf = subPart.components(separatedBy: " ")
                return (subPartHalf[1], Int(subPartHalf[0])!)
            }
            .reduce(into: [String: Int]()) { dict, tuple in
                dict[tuple.0, default: 0] += tuple.1
            }
        //        print("draw: \(draw)")
        return(draw)
    }
    
    var newGame = Game(gameNum: gameNum, rounds: rounds)
    
//    print(newGame)
    return newGame
}
