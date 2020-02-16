//
//  TableViewViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 16.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Bond
import RealityKit

class TableViewViewController: UIViewController {
    @IBOutlet weak var namesTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeLastButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let names = MutableObservableArray<String>([])
        
        names.bind(to: namesTableView) { (dataSource, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "NamesCell") as! NamesTableViewCell
            
            cell.namesLabel.text = dataSource[indexPath.row]
            
            return cell
        }
        
        addButton.reactive.tap.observeNext {
            names.append(randomName())
        }
        
        removeLastButton.reactive.tap.observeNext {
            if !names.isEmpty {
                names.removeLast()
            }

        }
        
        func randomName() -> String {
            let names = ["Henry", "William", "Geoffrey", "Jim", "Jenifer", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan"]
            return names.randomElement()!
        }
    }
}
