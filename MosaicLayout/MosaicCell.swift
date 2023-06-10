//
//  MosaicCell.swift
//  MosaicLayout
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class MosaicCell: UICollectionViewCell {
    
    @IBOutlet weak var mosaicCell: UIView!
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 20
        
    }

}
