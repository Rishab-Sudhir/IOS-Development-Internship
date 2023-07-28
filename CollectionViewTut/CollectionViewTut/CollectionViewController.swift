//
//  CollectionViewController.swift
//  CollectionViewTut
//
//  Created by Rishab Sudhir on 27/06/23.
//
//subclass of UIcollectionViewController

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let dataSource: [String] = ["Tree1","Tree2","Tree3","Tree4","Tree5","Tree6"]
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let myLayout = UICollectionViewFlowLayout()

        layout.scrollDirection =
        UICollectionView.ScrollDirection.horizontal
        self.collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        self.collectionView.setCollectionViewLayout(layout,
                    animated: true)
    }
    
    //returns the number of trees in a section of a view, since theres only one section we are just returning the number of trees
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //return a collection view cell for each section
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        //"Cell" is the identifier
        //
        if let treeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            treeCell.configure(with:  dataSource[indexPath.row])
            print("Configured cell with tree name: \(dataSource[indexPath.row])") // Debug line
            //each row will correspond to each tree, which is passed in.
            cell = treeCell
        }
//        }else{
//            print("Unable to dequeue cell with identifier 'Cell' as CollectionViewCell") // Debug line
//        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = dataSource[indexPath.row]
        let nameVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        nameVC.treeName = name
        self.navigationController?.pushViewController(nameVC, animated: true)
    }
    
    
    
}
