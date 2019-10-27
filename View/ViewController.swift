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
    let viewModel = HolidayPlanningViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = CreateDictionary()
        let createdictionary = CreateDictionary()
        shimmeringView.isShimmering = true
    }
    @IBOutlet var shimmeringView: FBShimmeringView!

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
    cell.celllabel.text = viewModel.userEntry
        return cell
    }
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height

        return CGSize(width: width, height: height)

    }

}
