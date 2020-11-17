//
//  GuessScreenVC.swift
//  GuessTheNumber
//
//  Created by Ayşenur Günal on 27.10.2020.
//

import UIKit

class GuessScreenVC: UIViewController {

    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    
    var randomNumber:Int?
    var remainingRight = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessButton.layer.cornerRadius = 30
        
        randomNumber = Int.random(in: 0...100) //0-100
        print("random number : \(randomNumber!)")
    

        
    }
    
    @IBAction func guess(_ sender: Any) {
        helpLabel.isHidden = false
        remainingRight -= 1
        if let guess = Int(enterTextField.text!){
            if remainingRight != 0{
                if guess == randomNumber{
                    let result = true
                    performSegue(withIdentifier: "guessToResult", sender: result)
                }
                if guess > randomNumber!{
                    helpLabel.text = "Down"
                    remainingTimeLabel.text = "Remaining Right :\(remainingRight)"
                }
                if guess < randomNumber!{
                    helpLabel.text = "Up"
                    remainingTimeLabel.text = "Remaining Right :\(remainingRight)"
                    
                }
               
            }
            else{
                let result = false
                performSegue(withIdentifier: "guessToResult", sender: result)
            }
            enterTextField.text = ""
            
        }
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if let incomingData = sender as? Bool{
                let toGoVC = segue.destination as! ResultScreenVC
                toGoVC.result = incomingData
            }
            
        }
    }
    


