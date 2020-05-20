//
//  ViewController.swift
//  TrafficLight
//
//  Created by Bober on 20/05/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lightStack: UIStackView!
    
    private var clickCounter = -1
    private let lightOff:CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in lightStack.arrangedSubviews {
            startLightConfig(view)
        }
        startButton.layer.cornerRadius = 10
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        if clickCounter == -1 {
            startButton.setTitle("NEXT", for: .normal)
            clickCounter = 0
        }
        lightStack.arrangedSubviews[clickCounter % 3].alpha = 1
        lightStack.arrangedSubviews[(clickCounter + 2) % 3].alpha = lightOff
        clickCounter += 1
    }
    
    private func startLightConfig(_ view: UIView) {
        view.layer.cornerRadius = view.frame.width  / 2
        view.alpha = lightOff
    }
}

