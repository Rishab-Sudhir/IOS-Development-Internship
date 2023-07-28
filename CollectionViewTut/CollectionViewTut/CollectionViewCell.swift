//
//  CollectionViewCell.swift
//  CollectionViewTut
//
//  Created by Rishab Sudhir on 27/06/23.
//
//sub class of UICollectionViewCell


import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //a reference to the label in storyboard, control drag
    @IBOutlet private weak var TreeNameLabel: UILabel!
    
    //setting the tree label to the name we pass in
    func configure(with treeName: String){
        TreeNameLabel.text = treeName
    }
    
}
