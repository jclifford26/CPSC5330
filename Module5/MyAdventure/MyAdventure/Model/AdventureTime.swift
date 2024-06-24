//
//  AdventureTime.swift
//  MyAdventure
//
//  Created by James Clifford on 6/21/24.
//

import Foundation

struct Choice {
    init(_ adventure: String, _ o_1: String, _ o_2: String, _ r_1: Int, _ r_2: Int) {
        scene = adventure
        optionOne = o_1
        optionTwo = o_2
        resultOne = r_1
        resultTwo = r_2
    }
    var scene: String
    var optionOne: String
    var optionTwo: String
    var resultOne: Int
    var resultTwo: Int
}
