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
    
   
    var vCounter:Int = 0
    
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
        vCounter += 1
        prepareTimeLabel.text = String(vCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subPrepTime(_ sender: Any) {
        if vCounter >= 1 {
            vCounter -= 1
            prepareTimeLabel.text = String(vCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func addWorkTime(_ sender: Any) {
        vCounter += 1
        workTimeLabel.text = String(vCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subWorkTime(_ sender: Any) {
        if vCounter >= 1 {
            vCounter -= 1
            workTimeLabel.text = String(vCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func addRestTime(_ sender: Any) {
        vCounter += 1
        restTimeLabel.text = String(vCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subRestTime(_ sender: Any) {
        if vCounter >= 1 {
            vCounter -= 1
            restTimeLabel.text = String(vCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func addSets(_ sender: Any) {
        vCounter += 1
        setsLabel.text = String(vCounter)
        buttonClickObj.play()
    }
    
    
    @IBAction func subSets(_ sender: Any) {
        if vCounter >= 1 {
            vCounter -= 1
            setsLabel.text = String(vCounter)
            buttonClickObj.play()
        }
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        print("called")
        dingAudioObj.play()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        
        
        if segue.identifier == "showDetail" {
            let detailObj = segue.destination as! DetailsViewController
            detailObj.intName = "Prepare"

        }
    }
    
   
    
    
}



