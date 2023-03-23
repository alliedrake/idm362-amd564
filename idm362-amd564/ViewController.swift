//
//  ViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 1/19/23.
//

import UIKit
import AVFoundation

var dingAudioObj = AVAudioPlayer()
var buttonClickObj = AVAudioPlayer()

class ViewController: UIViewController {
  

    
    
    @IBOutlet weak var prepareTimeLabel: UILabel!
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    
    
    var prepCounter:Int = 1
    var workCounter:Int = 1
    var restCounter:Int = 1
    var setCounter:Int = 1
    
//    var remaining:String = "Remaining"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dingSound = Bundle.main.path(forResource: "sounds/ding-sound-effect", ofType: "mp3")
        
        do {
            dingAudioObj = try
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: dingSound!))
            dingAudioObj.prepareToPlay()
            print("sound file is loaded")
        }
        catch {
            print(error)
        }
        
        
        let buttonSound = Bundle.main.path(forResource: "sounds/click", ofType: "mp3")
        
        do {
            buttonClickObj = try
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonSound!))
            buttonClickObj.prepareToPlay()
            print("sound file is loaded")
        }
        catch {
            print(error)
        }
    }
    
    
    
    
    @IBAction func addPrepTime(_ sender: Any) {
        prepCounter += 1
        prepareTimeLabel.text = String(prepCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subPrepTime(_ sender: Any) {
        if prepCounter >= 1 {
            prepCounter -= 1
            prepareTimeLabel.text = String(prepCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func addWorkTime(_ sender: Any) {
        workCounter += 1
        workTimeLabel.text = String(workCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subWorkTime(_ sender: Any) {
        if workCounter >= 1 {
            workCounter -= 1
            workTimeLabel.text = String(workCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func addRestTime(_ sender: Any) {
        restCounter += 1
        restTimeLabel.text = String(restCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subRestTime(_ sender: Any) {
        if restCounter >= 1 {
            restCounter -= 1
            restTimeLabel.text = String(restCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func addSets(_ sender: Any) {
        setCounter += 1
        setsLabel.text = String(setCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subSets(_ sender: Any) {
        if setCounter >= 1 {
            setCounter -= 1
            setsLabel.text = String(setCounter)
            buttonClickObj.play()
        }
    }
    
    
    
    @IBAction func startButton(_ sender: Any) {
        print("called")
        dingAudioObj.play()
    }
    
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        
        if segue.identifier == "showDetails" {
            let detailObj = segue.destination as! DetailsViewController
            detailObj.intName = "Prepare"
            detailObj.prepTime = prepareTimeLabel.text
            detailObj.setsNum = setsLabel.text
            // Before we call other view, we convert string to int
            detailObj.prepTimeInt = Int(prepareTimeLabel.text!)
            detailObj.workTimeInt = Int(workTimeLabel.text!)
            detailObj.restTimeInt = Int(restTimeLabel.text!)
            detailObj.rounds_remaining = Int(setsLabel.text! + "\("remaining")")  
            
            
            
            
        }
    }
    
    
}



