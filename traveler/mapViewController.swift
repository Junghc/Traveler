//
//  mapViewController.swift
//  traveler
//
//  Created by User16 on 2019/1/10.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit
import MapKit
class mapViewController: UIViewController {
    var travel=""
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getCoordinate(travel) { (location) in
            guard let location = location else { return }
            let xScale:CLLocationDegrees = 0.001
            let yScale:CLLocationDegrees = 0.001
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: xScale, longitudeDelta: yScale)
            let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
            self.mapView.setRegion(region, animated: true)
            self.mapView.isZoomEnabled = true
            
            // set mark
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "\(self.travel)"
            //annotation.subtitle = "\(self.company.address)"
            self.mapView.addAnnotation(annotation)
            
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

extension mapViewController {
    // 透過地址取得地圖的座標
    func getCoordinate(_ address:String, completion: @escaping (CLLocationCoordinate2D?) -> ()) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard error == nil else {
                print("error")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
}
