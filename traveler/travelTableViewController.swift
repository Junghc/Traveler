//
//  travelTableViewController.swift
//  traveler
//
//  Created by User02 on 2019/1/7.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class travelTableViewController: UITableViewController {
// https://gis.taiwan.net.tw/XMLReleaseALL_public/scenic_spot_C_f.json
    
    var travels = [Travel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlStr = "https://gist.githubusercontent.com/Junghc/ec6b543060bd01df2e982a28da17bdd4/raw/84b091d5ce0534b14b4efc2f4b373a93b0adfe4c/travel.json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let travelResults = try? decoder.decode(TravelResults.self, from: data)  {
                    print("enter")
                    self.travels = travelResults.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                else{
                    print("error")
                }
            }
            task.resume()
            
        }
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return travels.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath)as! travelTableViewCell

        // Configure the cell...

        let travel = travels[indexPath.row]
        cell.nameLabel.text = travel.Name
        
        /*
        let task = URLSession.shared.dataTask(with: movie.artworkUrl100) { (data, response , error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.photoImageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()*/
        
        return cell
    }
    

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
        
        let controller = segue.destination as? travelDetailViewController
        if let row = tableView.indexPathForSelectedRow?.row {
            let travel = travels[row]
            controller?.travel=travel
        }
        
    }

}
