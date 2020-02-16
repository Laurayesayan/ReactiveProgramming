//
//  LabelButtonViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 14.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class LabelButtonViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counter = Property(0)
        counterLabel.text = "\(counter)"
        counter.map{"\($0)"}.bind(to: counterLabel)

        increaseButton.reactive.tap.observeNext {
            counter.value += 1
        }
        
    }
    
}

