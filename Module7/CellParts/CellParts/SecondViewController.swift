//
//  SecondViewController.swift
//  CellParts
//
//  Created by James Clifford on 7/5/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var cellDetailsLabel: UILabel!
    
    var organelle: Parts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let organelle = organelle {
            cellDetailsLabel.text = "\(organelle.name): \(organelle.description)"
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
