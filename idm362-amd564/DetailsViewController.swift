//
//  DetailsViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 3/6/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // Set up vars for segue
    var prepTime:Int?
    var workTime:Int?
    var restTime:Int?
    var setsNum: Int?
    
    var intName:String?
    
    

    
    @IBOutlet weak var intervalName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intervalName.text = intName?.uppercased()
        
        
        

        // Do any additional setup after loading the view.
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
