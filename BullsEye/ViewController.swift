//
//  ViewController.swift
//  BullsEye
//
//  Created by PrincePhoenix on 05.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    
    var targetValue = 0
    var currentValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
            updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is \(currentValue)"
                    + "\n The target value is \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World!",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

