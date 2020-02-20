//
//  SearchViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 14.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Bond

import RxRelay
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Bond implementation
        searchTextField.reactive.text
            .ignoreNils()
            .filter{$0.count > 0}
            .debounce(for: 0.5)
            .observeNext { text in
                print("Отправка запроса для \(text)")
        }
        
//      // RXSwift implementation
//        searchTextField.rx.text.orEmpty.asObservable()
//            .filter{$0.count > 1}
//            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
//            .takeUntil(self.rx.deallocated)
//            .subscribe(onNext: {
//                text in
//                print("Отправка запроса для \(text)")
//            })
    }
}
