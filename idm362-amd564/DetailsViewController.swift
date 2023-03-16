//
//  DetailsViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 3/6/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var prepTime:String?
    var prepTimeInt:Int?

    var workTime:Int?
    var workTimeInt:Int?
    
    var restTime:Int?
    var restTimeInt:Int?
    
    var setsNum:String?
    var setsNumInt:Int?
    
    var intName:String?
    
    var current_time:Int?
    
    var phase = "stopped"
    
   

    
       var timer = Timer()
       var isTimerRunning = false //This will be used to make sure only one timer is created at a time.

    
   
     
    
    
    // Timer label
    @IBOutlet weak var intervalName: UILabel!
    @IBOutlet weak var whatTime: UILabel!
    @IBOutlet weak var whatSet: UILabel!
    
    
    
    var resumeTapped = false

    @IBAction func pauseButton(_ sender: UIButton) {
        if self.resumeTapped == false {
                          timer.invalidate()
                          self.resumeTapped = true
                     } else {
                          runTimer()
                          self.resumeTapped = false
                     }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        current_time = prepTimeInt//This variable will hold a starting value of current_time. It could be any amount above 0.
        
        runTimer()
        
        phase = "prepare"
        setsNumInt = Int(setsNum!)

        // Do any additional setup after loading the view.
        
        intervalName.text = intName?.uppercased()
        whatTime.text = prepTime?.uppercased()
        whatSet.text = setsNum?.uppercased()
    }
    
    //Update timer
    @objc func updateTimer() {
        
        // Check if current_time hits 0, then switch to other times
        if (current_time! > 0) {
            current_time! -= 1     //This will decrement(count down)the current_time.
            whatTime.text = "\(String(current_time!))" //This will update the label.
        } else {
            // Find out what phase is and put in switch code
            switch (phase) {
            case "prepare":
                phase = "work"
//                setsNumInt! -= 1
                current_time = workTimeInt
                whatTime.text = "\(String(current_time!))"
                intervalName.text = "WORK"
                print("phase has changed to work")
            case "work":
                if (current_time == 0) {
                    phase = "rest"
                    current_time = restTimeInt
                    whatTime.text = "\(String(current_time!))"
                    intervalName.text = "REST"
                    print("phase has changed to rest")
                    self.view.backgroundColor = UIColor.red
                }
//            case "rest":
//                if (current_time == 0) {
//                    setsNumInt! -= 1
//                    phase = "work"
//                }
                break
            default:
                intervalName.text = "DONE!"
                print("timer has ran out")
            }
        }
    } // Update timer end
    
    
    
    
    // Run the timer
        func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(DetailsViewController .updateTimer)), userInfo: nil, repeats: true)
            print("Start countdown timer at \(String(describing: prepTime))")
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
