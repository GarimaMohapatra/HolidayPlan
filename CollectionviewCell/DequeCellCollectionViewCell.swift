//
//  DequeCellCollectionViewCell.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 24/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import UIKit

final class DequeCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var celllabel: UILabel!

    func set(title: String) {
        self.celllabel.text = title
    }
}
