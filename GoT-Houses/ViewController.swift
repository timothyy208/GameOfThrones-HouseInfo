//
//  ViewController.swift
//  GoT-Houses
//
//  Created by Timothy Yang on 4/8/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var houses = Houses()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        houses.getHouses {
            self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHouseInfo" {
            let destination = segue.destination as! HouseDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            destination.houseInfo = houses.houseArray[index]
        } else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: false)
            }
        }
    }
    
    
    @IBAction func loadMore(_ sender: UISwipeGestureRecognizer) {
        print("HI")
        houses.getHouses {
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.houseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = houses.houseArray[indexPath.row].name
        return cell
    }
}
