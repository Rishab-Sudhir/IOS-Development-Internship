//
//  ViewController.swift
//  Stacked Collection Views
//
//  Created by Rishab Sudhir on 28/06/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let data: [String] = ["Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant", "Unopened Plant"]
    
    let data2: [String] = ["Plant", "Plant", "Plant", "Plant"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()


    }
    
    func createLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {sectionIndex, layoutEnvironment in
            
            if sectionIndex == 0{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))) //basically fill the container
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(130), heightDimension: .absolute(100)), subitems: [item])
                
                //section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                section.interGroupSpacing = 15 //spacing between elements
                
                section.contentInsets = .init(top: 5, leading: 0, bottom: 0, trailing: 10) //spacing from beginning end top and bottom
                
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
            }else{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))) //basically fill the container
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(130), heightDimension: .absolute(100)), subitems: [item])
                
                //section
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
            
        }
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
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

