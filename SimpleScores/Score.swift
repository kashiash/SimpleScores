//
//  Score.swift
//  SimpleScores
//
//  Created by Jacek on 17/06/2022.
//

import Foundation

struct Score: Codable, Identifiable, Hashable {
    var id = UUID()
    var playerName = "New Player"
    var score = 0
    var color = ColorChoice.blue

    static let example = Score()
}
