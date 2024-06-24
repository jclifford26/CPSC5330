//
//  AdventureLogic.swift
//  MyAdventure
//
//  Created by James Clifford on 6/21/24.
//

import Foundation

struct AdventureChoice {
    let scene: String
    let optionOne: String
    let optionTwo: String
    let resultOne: Int
    let resultTwo: Int
}

struct AdventureLogic {
    var choiceIndex: Int = 0
    let optionChoices: [AdventureChoice] = [
        AdventureChoice(scene: "Your car breaks down in the middle of the night, and you need help. Only thing around is this empty looking house with the light on. What do you do?", optionOne: "Just walk away. Too creepy.", optionTwo: "Go inside, what can it hurt.", resultOne: 1, resultTwo: 2),
        AdventureChoice(scene: "Wow! How lame! Just go into the house already.", optionOne: "OK, Fine!", optionTwo: "Yeah you're right. Facing death is better than being lame.", resultOne: 0, resultTwo: 0),
        AdventureChoice(scene: "Inside you see an empty room with one staircase leading up, one staircase leading down. Which one do you take?", optionOne: "Go up. Those rickety steps look promising.", optionTwo: "Go down. Nothing weird about a cold, dark basement.", resultOne: 3, resultTwo: 4),
        AdventureChoice(scene: "Upstairs you find two doors. One on the left, and the other on the right. Which should you take?", optionOne: "Left seems lucky.", optionTwo: "Right all night.", resultOne: 5, resultTwo: 6),
        AdventureChoice(scene: "Downstairs you find two doors. One on the left, and the other on the right. Which should you take?", optionOne: "Left seems lucky.", optionTwo: "Right all night.", resultOne: 7, resultTwo: 8),
        AdventureChoice(scene: "Good news! You find a box of treasure! Wow, how random. What will you spend it on?", optionOne: "Not sure. Let me wake up and think about it", optionTwo: "This is a dream isn't it?", resultOne: 0, resultTwo: 0),
        AdventureChoice(scene: "AH! It's a monster! And it's coming right for you!", optionOne: "Wake up in a cold sweat", optionTwo: "Wake up indifferently. Not the worst dream I've had", resultOne: 0, resultTwo: 0),
        AdventureChoice(scene: "Suddenly you're in front of your whole class. And your standing in your underwear?", optionOne: "I feel more bad for them than embarrassment for myself", optionTwo: "This dream is very unoriginal", resultOne: 0, resultTwo: 0),
        AdventureChoice(scene: "You step through the door and realize there is no floor as you begin falling.", optionOne: "Wake up doing that jump/scream thing.", optionTwo: "Fall into another dream. This one is lame.", resultOne: 0, resultTwo: 0)
    ]

    func getCurrentChoice() -> AdventureChoice {
        return optionChoices[choiceIndex]
    }

    mutating func makeChoice(_ choice: String) {
        let currentChoice = getCurrentChoice()
        choiceIndex = (choice == currentChoice.optionOne) ? currentChoice.resultOne : currentChoice.resultTwo
    }
}
