//
//  ViewController.swift
//  ReactiveProgramming_2_3
//
//  Created by Лаура Есаян on 12.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.isUserInteractionEnabled = true
        emailTextField.reactive.text
            .ignoreNils()
            .filter{$0.count > 5}
            .map{$0.isValidEmail ? "" : "Incorrect e-mail"}
            .bind(to: infoLabel.reactive.text)
        
        passwordTextField.reactive.text
            .ignoreNils()
            .filter{$0.count != 0}
            .map{$0.isValidPassword ? "" : "Too short password"}
            .bind(to: infoLabel.reactive.text)
        
        combineLatest(emailTextField.reactive.text, passwordTextField.reactive.text) { email, password in
            return email!.isValidEmail && password!.isValidPassword
        }
        .bind(to: sendButton.reactive.isEnabled)
    
    }
    
}

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").evaluate(with: self)
    }
    var isValidPassword: Bool {
        return self.count >= 6
    }
}

