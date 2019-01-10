//
//  editDiaryTableViewController.swift
//  traveler
//
//  Created by User02 on 2019/1/7.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class editDiaryTableViewController: UITableViewController, UITextFieldDelegate {
    var diary: Diary?
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var evaSeg: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    var formatter: DateFormatter! = nil
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        
        let myTextField =
            self.view?.viewWithTag(200) as? UITextField
        
        myTextField?.text =
            formatter.string(from: datePicker.date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let diary = diary {
            timeTextField.text = diary.time
            locationTextField.text = diary.location
            evaSeg.selectedSegmentIndex = diary.evaluationIndex
            textView.text = diary.text
        }
        
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .date
        myDatePicker.date = NSDate() as Date
        
        
        myDatePicker.addTarget(
            self,
            action: #selector(editDiaryTableViewController.datePickerChanged),
            for: .valueChanged)
        
        timeTextField.inputView = myDatePicker
        timeTextField.tag = 200
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let time = timeTextField.text ?? ""
        let title = locationTextField.text ?? ""
        let text = textView.text ?? ""
        diary = Diary(time: time, location: title, evaluationIndex: evaSeg.selectedSegmentIndex, text: text)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        var result = true
        if timeTextField.text?.isEmpty == true || locationTextField.text?.isEmpty == true {
            result = false
            
            let alertController = UIAlertController(title: "error", message: "請輸入文字", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        return result
    }
    
    
}
