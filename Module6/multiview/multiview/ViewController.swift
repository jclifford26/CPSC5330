//
//  ViewController.swift
//  multiview
//
//  Created by James Clifford on 6/25/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func navigate(_ sender: UIButton) {
        self.shouldPerformSegue(withIdentifier: "toNavigation", sender: self)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNavigation" {
            let navigation = segue.destination as! navigationviewcontrollerViewController
            navigation.welcome = "Hey"
        }
        
    }
    
}

