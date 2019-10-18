//
//  ViewController.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 11/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import UIKit
import MapKit
import Shimmer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let requestlocation = CLLocationManager()
       
        requestlocation.delegate = self
        requestlocation.requestAlwaysAuthorization()
        requestlocation.requestWhenInUseAuthorization()
        requestlocation.requestLocation()
       
        datePicker.addTarget(self, action: #selector(datePickerSelector(sender:)), for: .valueChanged)
        datePicker.date =  Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let todayDate = dateFormatter.string(from: datePicker.date)
        fromButton.setTitle(todayDate, for: .normal)
        toButton.setTitle(todayDate, for: .normal)
        shimmeringView.contentView = shimmeringLabel
        shimmeringView.isShimmering = true
        
    }
  
    @IBOutlet weak var shimmeringSubview: UIView!
    
    @IBOutlet var shimmerMainView: FBShimmeringView!
    
    @IBOutlet var shimmeringView:FBShimmeringView!
 
    @IBOutlet weak var shimmerSubview: UIView!
    @IBOutlet weak var startingPoint: UILabel!
    
    @IBOutlet weak var fromButton: UIButton!
    
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var shimmeringLabel: UIView!
    @IBAction func startDate(_ sender: Any) {
         
    }
    
    @objc func datePickerSelector(sender: UIDatePicker) {
     let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
       let dateString = dateFormatter.string(from: sender.date)
        print(dateString)
        fromButton.setTitle(dateString, for: .normal)
        toButton.setTitle(dateString, for: .normal)
    }
    
    

}
 extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location)
            let geocode = CLGeocoder()
            var placemark : CLPlacemark?
            geocode.reverseGeocodeLocation(location) { (placemarks, error) in
                if error != nil {
                    print("something went wrong")
                }
                if let placemarks = placemarks {
                    placemark = placemarks.first
                }
                self.startingPoint.text = "\(placemark!.country! ?? "No country found"),\(placemark!.locality! ?? "No locality found")"
            }
            
        }
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //scrollView.contentOffset.x = 2800
        
    }
}

