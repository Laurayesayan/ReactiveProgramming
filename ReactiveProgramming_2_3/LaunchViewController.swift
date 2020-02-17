//
//  LaunchViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 16.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class LaunchViewController: UIViewController {
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let isFirstButtonTapped = Property(false)
        let isSecondButtonTapped = Property(false)
        
        firstButton.reactive.tap.observe { _ in
            isFirstButtonTapped.value = true
        }
        
        secondButton.reactive.tap.observe {_ in
            isSecondButtonTapped.value = true
        }
        
        isFirstButtonTapped.observe { [weak self] _ in
            if isSecondButtonTapped.value {
                self!.launchLabel.text = "Ракета запущена"
            }
        }
        
        isSecondButtonTapped.observe { [weak self] _ in
            if isFirstButtonTapped.value {
                self!.launchLabel.text = "Ракета запущена"
            }
        }
        
    }
}
