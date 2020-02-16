//
//  SearchViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 14.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.reactive.text
            .ignoreNils()
            .filter{$0.count != 0}
            .debounce(for: 0.5)
            .observeNext { text in
                print("Отправка запроса для \(text)")
        }
    }
}
