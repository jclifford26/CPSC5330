//
//  ViewController.swift
//  MyAdventure
//
//  Created by James Clifford on 6/21/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var adventureLabel: UILabel!
    
    var adventureLogic = AdventureLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func optionChosen(_ sender: UIButton) {
        guard let optionSubmitted = sender.titleLabel?.text else { return }
        let currentChoice = adventureLogic.getCurrentChoice()
        adventureLogic.choiceIndex = (optionSubmitted == currentChoice.optionOne) ? currentChoice.resultOne : currentChoice.resultTwo
        sender.backgroundColor = .green
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        let currentChoice = adventureLogic.getCurrentChoice()
        adventureLabel.text = currentChoice.scene
        optionOne.setTitle(currentChoice.optionOne, for: .normal)
        optionTwo.setTitle(currentChoice.optionTwo, for: .normal)
        optionOne.backgroundColor = .clear
        optionTwo.backgroundColor = .clear
    }
}
