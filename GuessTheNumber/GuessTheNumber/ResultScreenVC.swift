//
//  ResultScreenVC.swift
//  GuessTheNumber
//
//  Created by Ayşenur Günal on 27.10.2020.
//

import UIKit

class ResultScreenVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    var result:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 30
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Result Page"
        
        if result!{
            resultLabel.text = "You Win"
            image.image = UIImage(named: "win")
            //self.view.backgroundColor = UIColor.systemPink
        }
        else{
            resultLabel.text = "You Lost"
            image.image = UIImage(named: "lose")
            //self.view.backgroundColor = UIColor.purple
        }
        
        
    }
    
    @IBAction func tryAgainButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    


}
