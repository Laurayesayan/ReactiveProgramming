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

//import RxRelay
//import RxSwift
//import RxCocoa

class LabelButtonViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    private let disposeBag = DisposeBag()
//    private var mutable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Bond implementation
        let counter = Property(0)
        counterLabel.text = "\(counter)"
        counter.map{"\($0)"}.bind(to: counterLabel)

        increaseButton.reactive.tap.observeNext {
            counter.value += 1
        }
        
        // RXSwift implementation
//        let counter = BehaviorRelay<Int>(value: 0)
//        counterLabel.text = "\(counter)"
//        counter.map{"\($0)"}
//            .bind(to: counterLabel.rx.text)
//        .disposed(by: disposeBag)
//
//        increaseButton.rx.tap.subscribe({ _ in
//            counter.accept(counter.value + 1)
//        })
//        .disposed(by: disposeBag)
    }
    
}

