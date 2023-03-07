//
//  DetailsViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 3/6/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var prepTime:String?
    var workTime:Int?
    var restTime:Int?
    
    var setsNum:String?
    
    var intName:String?
    
    
    
    @IBOutlet weak var intervalName: UILabel!
    @IBOutlet weak var whatTime: UILabel!
    @IBOutlet weak var whatSet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        intervalName.text = intName?.uppercased()
        whatTime.text = prepTime?.uppercased()
        whatSet.text = setsNum?.uppercased()
        
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
