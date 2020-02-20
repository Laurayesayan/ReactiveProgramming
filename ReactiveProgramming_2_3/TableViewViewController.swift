//
//  TableViewViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 16.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
//import Bond
//import RealityKit
import RxRelay
import RxSwift
import RxCocoa

class TableViewViewController: UIViewController {
    @IBOutlet weak var namesTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeLastButton: UIButton!
    private let disposeBag = DisposeBag()
    private var randomNames = [String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Bond implementation
//        let names = MutableObservableArray<String>([])
//
//        names.bind(to: namesTableView) { (dataSource, indexPath, tableView) -> UITableViewCell in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "NamesCell") as! NamesTableViewCell
//
//            cell.namesLabel.text = dataSource[indexPath.row]
//
//            return cell
//        }
//
//        addButton.reactive.tap.observeNext {
//            names.append(randomName())
//        }
//
//        removeLastButton.reactive.tap.observeNext {
//            if !names.isEmpty {
//                names.removeLast()
//            }
//
//        }
        
        // Neutral function for getting random name
        func randomName() -> String {
            let names = ["Henry", "William", "Geoffrey", "Jim", "Jenifer", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan"]
            return names.randomElement()!
        }
        
        // RXSwift implementation
        let names = BehaviorRelay<[String]>(value: [])
        
            names.bind(to: namesTableView.rx.items(cellIdentifier: "NamesCell", cellType: NamesTableViewCell.self)) { row, name, cell in
                cell.namesLabel.text = name
            }
            .disposed(by: disposeBag)
        
        addButton.rx.tap.subscribe({ _ in
            self.randomNames.append(randomName())
            names.accept(self.randomNames)
            })
            .disposed(by: disposeBag)
        
        removeLastButton.rx.tap.subscribe{ _ in
            if !self.randomNames.isEmpty {
                self.randomNames.removeLast()
            }
            names.accept(self.randomNames)
        }
        .disposed(by: disposeBag)
    }
}

