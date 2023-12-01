//
//  GetInput.swift
//  Advent of Code 2022
//
//  Created by Jake Martin on 7/25/23.
//

import Foundation

enum FileError: Error {
    case fileNotFound
    case unableToReadContents
}

func getInput(filename: String) -> String {
    
    let sourceFileURL = URL(fileURLWithPath: #filePath)
        let directoryURL = sourceFileURL.deletingLastPathComponent()
        let fileURL = directoryURL.appendingPathComponent(filename)
    
    if let content = try? String(contentsOf: fileURL, encoding: .utf8) {
            return content
        } else {
            fatalError("Failed to read the file: \(filename)")
        }
}
