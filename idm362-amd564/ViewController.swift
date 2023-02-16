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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var popUpButton: UIButton!
    
    var vCounter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.textColor = UIColor(named: "Prince")
        spinner.startAnimating()
        setUpPopUpButton()
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
    
    
    @IBAction func SliderMoving(_ sender: UISlider) {
        displayLabel.text = "Slider value is \(sender.value)"
    }
    
    
    @IBAction func spinSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
    
    
    @IBAction func finishLine(_ sender: UISegmentedControl) {
        displayLabel.text = "You Finished \(sender.titleForSegment(at: sender.selectedSegmentIndex)!)"
    }
    
    func setUpPopUpButton() {
        // Build and setup popUpButton values
        let optionsObj = {
//            (action : UIAction) in print(action.title)
            (action: UIAction) in self.displayLabel.text = action.title
        }
        
        popUpButton.menu = UIMenu(children: [
            UIAction(title: "Mild", state: .on, handler: optionsObj),
            UIAction(title: "Medium", handler: optionsObj),
            UIAction(title: "Spicy", handler: optionsObj)
        ])
        
        popUpButton.showsMenuAsPrimaryAction = true
        popUpButton.changesSelectionAsPrimaryAction = true
        popUpButton.tintColor = UIColor(named: "Prince")
        
    }
}

