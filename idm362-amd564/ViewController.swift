//
//  ViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 1/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var prepareTimeLabel: UILabel!
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    
    
    var vCounter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addPrepTime(_ sender: Any) {
        vCounter += 1
        prepareTimeLabel.text = String(vCounter)
    }
    

    @IBAction func subPrepTime(_ sender: Any) {
        vCounter -= 1
        prepareTimeLabel.text = String(vCounter)
    }
    
    
    @IBAction func addWorkTime(_ sender: Any) {
        vCounter += 1
        workTimeLabel.text = String(vCounter)
    }
    
    
    @IBAction func subWorkTime(_ sender: Any) {
        vCounter -= 1
        workTimeLabel.text = String(vCounter)
    }
    
    
    @IBAction func addRestTime(_ sender: Any) {
        vCounter += 1
        restTimeLabel.text = String(vCounter)
    }
    
    
    @IBAction func subRestTime(_ sender: Any) {
        vCounter -= 1
        restTimeLabel.text = String(vCounter)
    }
    
    
    @IBAction func addSets(_ sender: Any) {
        vCounter += 1
        setsLabel.text = String(vCounter)
    }
    
    
    @IBAction func subSets(_ sender: Any) {
        vCounter -= 1
        setsLabel.text = String(vCounter)
    }
    
    
}




