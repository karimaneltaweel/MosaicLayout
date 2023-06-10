//
//  ViewController.swift
//  MosaicLayout
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
    }

    func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let fullView = compoitionalLayout.createItem(itemWidth: .fractionalWidth(0.5), itemHeight: .fractionalHeight(1), itemSpacing: 8)
        let smallView = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(1), itemSpacing: 8)
        
        let groupOftwoViews = compoitionalLayout.createGroupWithItem(alignment: .horizontal, groupWidth:.fractionalWidth(1), groupHeight: .fractionalHeight(1), item: smallView, count: 2)
        
        let groupOffourViews = compoitionalLayout.createGroupWithItem(alignment: .vertical, groupWidth: .fractionalWidth(0.5), groupHeight: .fractionalHeight(1), item: groupOftwoViews, count: 2)

        let firstGroup = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth: .fractionalWidth(1), groupHeight: .fractionalHeight(0.5), items: [fullView,groupOffourViews])
        
        let secondGroup = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth: .fractionalWidth(1), groupHeight: .fractionalHeight(0.5), items: [groupOffourViews,fullView])
        
        //group
        let mainGroup = compoitionalLayout.createGroupWithItems(alignment: .vertical, groupWidth: .fractionalWidth(1), groupHeight: .fractionalHeight(0.7), items: [firstGroup,secondGroup])
        //section
        let section = NSCollectionLayoutSection(group:mainGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }

}
extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MosaicCell", for: indexPath) as! MosaicCell
        return cell
    }
    
    
}
