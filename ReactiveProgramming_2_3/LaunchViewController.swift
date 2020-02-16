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
        
        let launchText = Property("")
        let isFirstButtonTapped = Property(false)
        let isSecondButtonTapped = Property(false)
        
//        firstButton.reactive.tap.observeNext {
//            isFirstButtonTapped.value = true
//            print(isFirstButtonTapped.value)
//        }
//
//        secondButton.reactive.tap.observeNext {
//            isSecondButtonTapped.value = true
//            print(isSecondButtonTapped.value)
//        }
        
        firstButton.reactive.tap.map{true}.bind(to: isFirstButtonTapped)
        
        launchText.map{"\($0)"}.bind(to: launchLabel)
        
//        if(isFirstButtonTapped && isSecondButtonTapped) {
//            launchLabel.text = "Ракета запущена"
//        }

//        combineLatest(emailTextField.reactive.text, passwordTextField.reactive.text) { email, password in
//            return email!.isValidEmail && password!.isValidPassword
//        }
//        .bind(to: sendButton.reactive.isEnabled)
        
    }
}
