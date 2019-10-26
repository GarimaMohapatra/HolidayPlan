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

    @IBOutlet weak var collectionview: UICollectionView!
var  parameters: Parameters<OxfordDictonary> {

        let url = "https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/example"
        let dic = ["app_id": "ac5f4204", "app_key": "188096a142883e86eee4ef848845411c"]
        _ = OxfordDictonary.self
        let componentScheme = "https"
        let componenthost = "od-api.oxforddictionaries.com"
        let appendcomponent = "/api/v2/entries/en-gb"
        let userEntry = "/love"
        let token: String? = nil
        let value: String? = nil

let returnParameter = Parameters<OxfordDictonary>(url: url, dic: dic, model: OxfordDictonary.self, componentScheme: componentScheme, componenthost: componenthost, appendcomponent: appendcomponent, userEntry: userEntry, token: token, value: value)
        return returnParameter
    }
override func viewDidLoad() {
    super.viewDidLoad()
    _ = CreateDictionary()
        let requestlocation = CLLocationManager()
        let createdictionary = CreateDictionary()
createdictionary.postServiceRequest(parameters: parameters) { (model, _) in
            print(model!)
        }
requestlocation.delegate = self
        requestlocation.requestAlwaysAuthorization()
        requestlocation.requestWhenInUseAuthorization()
        requestlocation.requestLocation()
        shimmeringView.isShimmering = true
    }

    @IBOutlet var shimmeringView: FBShimmeringView!

}
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location)
            let geocode = CLGeocoder()
            var placemark: CLPlacemark?
            geocode.reverseGeocodeLocation(location) { (placemarks, error) in
                if error != nil {
                    print("something went wrong")
                }
                if let placemarks = placemarks {
                    placemark = placemarks.first
                }
            }

        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   guard let cell = collectionView.dequeueReusableCell(
    withReuseIdentifier: "reuseCell", for: indexPath)
    as? DequeCellCollectionViewCell else {
            preconditionFailure("Could not dequeue cell as DequeCellCollectionViewCell")
        }
        cell.set(title: parameters.userEntry)
        return cell
    }
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height

        return CGSize(width: width, height: height)

    }

}
