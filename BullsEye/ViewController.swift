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
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var targetValue = 0
    var currentValue = 0
    var score = 0
    var round = 0 {
        didSet {
            roundLabel.text = String(round)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        var title: String
        switch difference {
        case 0:
            title = "Perfect"
            points += 100
        case 1...5:
            title = "You almost had it!"
            points += 50
        case 6...10:
            title = "Pretty Good!"
        default:
            title = "Not even close..."
        }

        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { [unowned self] _ in
            self.startNewRound()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
    }
}
