//
//  CollectionView.swift
//  Stacked Collection Views
//
//  Created by Rishab Sudhir on 28/06/23.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{

    let data: [String] = ["Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant"]
    
    let data2: [String] = ["Plant", "Plant", "Plant", "Plant"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return data.count
        }else{
            return data2.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var Cell = UICollectionViewCell()
        
        if let plantCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCellHorizontal{
            
            if indexPath.section == 0{
                plantCell.configure(with: data[indexPath.row])
                Cell = plantCell
            }else{
                plantCell.configure(with: data2[indexPath.row])
                Cell = plantCell
            }
        }
        return Cell
    }
    
    //for the header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as? CollectionHeaderView{
            if indexPath.section == 0{
                sectionHeader.headerTitle.text = "Unopened Rewards"
            }else{
                sectionHeader.headerTitle.text = "Growing Rewards"
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}
