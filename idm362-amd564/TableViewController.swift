//
//  TableViewController.swift
//  idm362-amd564
//
//  Created by Allison Drake on 3/2/23.
//

import UIKit



class TableViewController: UITableViewController {
    
    // Global VARS
    
    var fNames: [String] = ["Judith", "Jennifa", "John", "Joseph", "Jervis"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fNames.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = fNames[indexPath.row]

        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete from array
            fNames.remove(at: indexPath.row)
            // Reload table
            tableView.reloadData()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    @IBAction func addName(_ sender: Any) {
        // Create an alert to get new name from user
        let alertObj = UIAlertController(title: "New Friend", message: "Add new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alertObj.textFields?.first,
                  let nameToSave = textField.text else {
                return
            }
            // Update array with new name
            self.fNames.append(nameToSave)
            // Reload table
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertObj.addTextField()
        alertObj.addAction(saveAction)
        alertObj.addAction(cancelAction)
        
        present(alertObj, animated: true)
    }
    
    
    
// When the user selects a row, pass that info on to the detail view
    
    var selRowNum:Int = 0
    var selRowName:String = ""
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected " + indexPath.row.description)
        selRowNum = indexPath.row
        selRowName = fNames[selRowNum]
        
        // Go to detail view trigger
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        // This is how we link the table view to the detail view
        if segue.identifier == "showDetail" {
            let detailObj = segue.destination as! DetailsViewController
            detailObj.ndxNum = selRowNum
            detailObj.incomingName = selRowName
        }
    }

    
    

}
