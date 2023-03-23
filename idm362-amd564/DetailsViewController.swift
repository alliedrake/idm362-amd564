//
//  DetailsViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 3/6/23.
//

import UIKit
import AVFAudio

class DetailsViewController: UIViewController {
    
    var prepTime:String?
    var prepTimeInt:Int?

    var workTime:Int?
    var workTimeInt:Int?
    
    var restTime:Int?
    var restTimeInt:Int?
    
    var setsNum:String?
    var rounds_remaining:Int?
    
    var intName:String?
    
    var current_time:Int?
    
    var phase = "stopped"
    
    var remaining:String = "Remaining"
    
    var dingAudioObj = AVAudioPlayer()
 

    
       var timer = Timer()
       var isTimerRunning = false //This will be used to make sure only one timer is created at a time.

    
   
     
    
    
    // Timer label
    @IBOutlet weak var intervalName: UILabel!
    @IBOutlet weak var whatTime: UILabel!
    @IBOutlet weak var whatSet: UILabel!
    
    @IBOutlet weak var howMany: UILabel!
    
    
//    var resumeTapped = false

//    @IBAction func pauseButton(_ sender: UIButton) {
//        if self.resumeTapped == false {
//                          timer.invalidate()
//                          self.resumeTapped = true
//                     } else {
//                          runTimer()
//                          self.resumeTapped = false
//                     }
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prep sound
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

        
        
        current_time = prepTimeInt//This variable will hold a starting value of current_time. It could be any amount above 0.
        
        runTimer()
        
        phase = "prepare"
        rounds_remaining = Int(setsNum!)

        // Do any additional setup after loading the view.
        
        intervalName.text = intName?.uppercased()
        whatTime.text = prepTime?.uppercased()
        whatSet.text = setsNum?.uppercased()
        howMany.text = setsNum?.uppercased()
    }
    
    //Update timer
    @objc func updateTimer() {
        
        
        // Display count down time
        if (current_time! >= 0) {
            whatTime.text = "\(String(current_time!))"
        }
          
          // Check if current_time hits 0, then switch to other times
          if (current_time! >= 0) {
          
              // Count down timer update
              current_time! -= 1     //This will decrement(count down)the current_time.

          } else {
              
              // Find out what phase is and put in switch code
              switch (phase) {
                  
              case "prepare":
                  print("case:prepare")
                  phase = "work"
                  current_time = workTimeInt
                  intervalName.text = "WORK"
                  whatTime.text = "\(String(current_time!))"
                  self.view.backgroundColor = UIColor(named: "GreenColor")
                  dingAudioObj.play()
                  break
              case "work":
                  print("case:work")
                  phase = "rest"
                  dingAudioObj.play()
                  current_time = restTimeInt
                  intervalName.text = "REST"
                  whatTime.text = "\(String(current_time!))"
                  self.view.backgroundColor = UIColor(named:"RedColor")
                  break
              case "rest":
                  print("case:rest")
                  phase = "work"
                  if (rounds_remaining! > 0) {
                    rounds_remaining! -= 1
                    whatSet.text = "\(String(rounds_remaining!))"
                    current_time = workTimeInt
                    intervalName.text = "WORK"
                    whatTime.text = "\(String(current_time!))"
                    dingAudioObj.play()
                    self.view.backgroundColor = UIColor(named: "GreenColor")
                  } else if (rounds_remaining == 0) {
                    print("DONE - Turn OFF Count Down Timer")
                      timer.invalidate()
                      whatTime.text = "0"
                      intervalName.text = "SWIPE DOWN!"
                  }
                  break
              default:
                  print("did it break?")
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
