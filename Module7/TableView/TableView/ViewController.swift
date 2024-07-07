//
//  ViewController.swift
//  TableView
//
//  Created by James Clifford on 7/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var cities = [
        CityState("Auburn", "AL"),
        CityState("Atlanta", "GA"),
        CityState("Chicago", "IL"),
        CityState("New York", "NY"),
        CityState("Los Angeles", "CA"),
        CityState("Austin", "TX"),
        CityState("Tuscon", "AZ"),
                                                          
    ]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            print("Deleted" + self.cities[indexPath.row].city)
            self.cities.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

