//
//  CollectionViewCellHorizontal.swift
//  Stacked Collection Views
//
//  Created by Rishab Sudhir on 28/06/23.
//

import UIKit

class CollectionViewCellHorizontal: UICollectionViewCell {
    @IBOutlet weak var plantLabel: UILabel!
    
    func configure(with plantname: String) {
        plantLabel.text = plantname
    }
//    override init(frame: CGRect) {
//        self.layer.cornerRadius = 15
//        self.clipsToBounds = true
//    }
    
    
}
