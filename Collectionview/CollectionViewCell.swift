//
//  CollectionViewCell.swift
//  Collectionview
//
//  Created by Meghna on 09/09/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
            didSet {
                if self.isSelected {
                    backgroundColor = UIColor.red
                }
                else {
                    backgroundColor = UIColor.purple
                }
            }
        }

}
