//
//  travelDetailViewController.swift
//  traveler
//
//  Created by User02 on 2019/1/7.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class travelDetailViewController: UIViewController {
    
    var travel: Travel?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var desciptTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let travel = travel {
            nameLabel.text = travel.Name
            telLabel.text = "Tel: \n"+travel.Tel
            addLabel.text = "Address: \n"+travel.Add
            desciptTextView.text = travel.Toldescribe
            navigationItem.title = travel.Name
            /*
            let task = URLSession.shared.dataTask(with: travel.Picture1) { (data, response , error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                
            }
            task.resume()*/
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "mapView" {
            // 傳遞公司資料到地圖頁面
            if let map = segue.destination as? mapViewController {
                map.travel = travel?.Add ?? ""
            }
        }
    
    }
    

}
