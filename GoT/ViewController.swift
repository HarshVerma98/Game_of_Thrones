//
//  ViewController.swift
//  GoT
//
//  Created by Harsh Verma on 19/07/20.
//  Copyright © 2020 Harsh Verma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //var stringArray: [String] = ["1","2","3","4","5"]
    
    var houses = Houses()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        houses.getdata {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let selectedPath = segue.destination as! DetailVC
            let indexx = tableView.indexPathForSelectedRow!
            selectedPath.houseInfo1 = houses.houseArray[indexx.row]
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.houseArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == houses.houseArray.count - 1 && houses.cont {
            houses.getdata {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(houses.houseArray[indexPath.row].name)"
        return cell
    }
}

