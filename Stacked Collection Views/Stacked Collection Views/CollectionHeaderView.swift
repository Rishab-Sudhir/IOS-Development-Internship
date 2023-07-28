//
//  CollectionHeaderView.swift
//  Stacked Collection Views
//
//  Created by Rishab Sudhir on 28/06/23.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var headerTitle: UILabel!
    
    func configure(with headername: String) {
        headerTitle.text = headername
    }

}
