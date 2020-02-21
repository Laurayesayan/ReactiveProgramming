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
//            names.append(randomName()) // Пример утечки памяти
//        }
//
//        removeLastButton.reactive.tap.observeNext {
//            if !names.isEmpty {
//                names.removeLast() // Пример утечки памяти
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
    
// Как предотвратить появление этого предупреждения?
    
//    ReactiveProgramming_2_3[61005:9961145] [TableView] Warning once only: UITableView was told to layout its visible cells and other contents without being in the view hierarchy (the table view or one of its superviews has not been added to a window). This may cause bugs by forcing views inside the table view to load and perform layout without accurate information (e.g. table view bounds, trait collection, layout margins, safe area insets, etc), and will also cause unnecessary performance overhead due to extra layout passes. Make a symbolic breakpoint at UITableViewAlertForLayoutOutsideViewHierarchy to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view has been added to a window. Table view: <UITableView: 0x7fe66c850800; frame = (0 -19.5; 414 896); clipsToBounds = YES; autoresize = RM+BM; gestureRecognizers = <NSArray: 0x6000001a58f0>; layer = <CALayer: 0x600000f03280>; contentOffset: {0, 0}; contentSize: {414, 22}; adjustedContentInset: {0, 0, 0, 0}; dataSource: <RxCocoa.RxTableViewDataSourceProxy: 0x600002b7bf00>>
    
}

