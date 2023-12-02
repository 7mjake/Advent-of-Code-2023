//
//  day02_part02.swift
//  Advent of Code 2023
//
//  Created by Jake Martin on 12/2/23.
//

import Foundation

func day02_part2() {
    
    let directPuzzleInput = getInput(filename: "day02/day02_realInput.txt")
    
    let puzzleInput = directPuzzleInput.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
    //        .map {$0.components(separatedBy: "\n")}
    
//    print(puzzleInput[0])
    
    let parsedGames: [Game] = puzzleInput.map{ game in
//        print(parseGame(game: game))
        return parseGame2(game: game)
    }
    
//    print(parsedGames)
    var gamePowers = [Int]()
    
    let maxRed = 12
    let maxGreen = 13
    let maxBlue = 14
    
    parsedGames.forEach { game in
        
        var gameMaxRed = 0
        var gameMaxBlue = 0
        var gameMaxGreen = 0
        
        game.rounds.forEach { round in
            round.forEach { draw in
                if draw.key == "red" && draw.value > gameMaxRed {
                    gameMaxRed = draw.value
                }
                if draw.key == "blue" && draw.value > gameMaxBlue {
                    gameMaxBlue = draw.value
                }
                if draw.key == "green" && draw.value > gameMaxGreen {
                    gameMaxGreen = draw.value
                }
            }
        }
        
        let gamePower = gameMaxRed * gameMaxBlue * gameMaxGreen
        gamePowers.append(gamePower)
        
    }
    
    print(gamePowers)
    print(gamePowers.reduce(0, +))
    
}

func parseGame2(game: String) -> Game {
    
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
    
    let newGame = Game(gameNum: gameNum, rounds: rounds)
    
//    print(newGame)
    return newGame
}
