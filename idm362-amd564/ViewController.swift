//
//  ViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 1/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    var vCounter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.textColor = UIColor(named: "Prince")
    }


    
    @IBAction func addBtn(_ sender: Any) {
        vCounter += 1
        displayLabel.text = String(vCounter)
    }
    
    
    @IBAction func touchMe(_ sender: Any) {
        displayLabel.text = "Well Hello there \(nameText.text!)"
    }
    
// Disable Keyboard when user touches elsewhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
}

