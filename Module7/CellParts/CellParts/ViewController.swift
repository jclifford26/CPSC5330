//
//  ViewController.swift
//  CellParts
//
//  Created by James Clifford on 7/5/24.
//

import UIKit

// Model
struct Parts {
    let name: String
    let description: String
}

// Controller
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let cellParts = [
        Parts(name: "Nucleus", description: "The nucleus, formed by a nuclear membrane around a fluid nucleoplasm, is the control center of the cell. Threads of chromatin in the nucleus contain deoxyribonucleic acid (DNA), the genetic material of the cell. The nucleus determines how the cell will function, as well as the basic structure of that cell."),
        Parts(name: "Mitochondrion", description: "The mitochondrion is called “the powerhouse of the cell.” It is called so because it produces ATP – the cell’s energy currency."),
        Parts(name: "Cytoplasm", description: "The cytoplasm is a thick, clear, jelly-like substance present inside the cell membrane. The cell organelles such as endoplasmic reticulum, vacuoles, mitochondria, ribosomes, are suspended in this cytoplasm"),
        Parts(name: "Cell Membrane", description: "The cell membrane is the outer covering of a cell within which all other organelles, such as the cytoplasm and nucleus, are enclosed. It is also referred to as the plasma membrane."),
        Parts(name: "Ribosomes", description: "Ribosomes are the protein synthesisers of the cell."),
        Parts(name: "Golgi Bodies", description: "Golgi bodies are called the cell’s post office as it is involved in the transportation of materials within the cell."),
        Parts(name: "Endoplasmic Reticulum", description: "The endoplasmic reticulum is involved in the transportation of substances throughout the cell. It plays a primary role in the metabolism of carbohydrates, synthesis of lipids, steroids and proteins."),
        Parts(name: "Vacuoles", description: "Vacuoles store food, water, and other waste materials in the cell."),
        Parts(name: "Cell Wall", description: "The cell wall is present exclusively in plant cells. It protects the plasma membrane and other cellular components. The cell wall is also the outermost layer of plant cells."),
        Parts(name: "Chloroplast", description: "Chloroplasts are the primary organelles for photosynthesis. It contains the pigment called chlorophyll. Found primarily in plant cells.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellParts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partsOfCell", for: indexPath)
        cell.textLabel?.text = cellParts[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPartDetails", sender: cellParts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPartDetails",
           let destinationVC = segue.destination as? SecondViewController,
           let selectedCellPart = sender as? Parts {
            destinationVC.organelle = selectedCellPart
        }
    }
}


