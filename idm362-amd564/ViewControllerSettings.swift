//
//  ViewControllerSettings.swift
//  idm362-amd564
//
//  Created by Allison Drake on 2/9/23.
//

import UIKit
import AVFoundation

var myAudioPlayerObj = AVAudioPlayer()


class ViewControllerSettings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let haloSound = Bundle.main.path(forResource: "sounds/halo1", ofType: "mp3")
        
        do {
            myAudioPlayerObj = try
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: haloSound!))
            myAudioPlayerObj.prepareToPlay()
            print("Sound file is loaded and ready to ROCK!")
        } catch {
            print(error)
        }
    }
    
    
    @IBAction func toggleHalo(_ sender: Any) {
        print("toggleHalo called")
        if (myAudioPlayerObj.isPlaying) {
            myAudioPlayerObj.stop()
        } else {
                myAudioPlayerObj.play()
            }
        }

    
    @IBAction func showAlert(_ sender: Any) {
        let myAlertObj = UIAlertController(title: "Delete ALL Records", message: "Are you sure?", preferredStyle: .alert)
        
        myAlertObj.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {
            (UIAlertAction) in
            print("User Canceled")
        }))
        
        myAlertObj.addAction(UIAlertAction(title: "YES", style: .default, handler: {
            (UIAlertAction) in
            print("User wants to delete call function")
        }))
        
        myAlertObj.view.tintColor = UIColor(named: "Prince")
        
        
        self.present(myAlertObj, animated: true)
    }
    
    var toggleFlag: Bool = false
    
    @IBOutlet weak var peepBtn: UIButton!
    
    @IBAction func peepBtnFun(_ sender: Any) {
        if (toggleFlag == true) {
            peepBtn.setBackgroundImage(UIImage(named: "people"), for: .normal)
            peepBtn.tintColor = UIColor(named: "AccentColor")
            toggleFlag = false
            
        } else {
            peepBtn.setBackgroundImage(UIImage(named: "user_man_woman"), for: .normal)
            peepBtn.tintColor = UIColor(named: "Prince")
            toggleFlag = true
        }
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
