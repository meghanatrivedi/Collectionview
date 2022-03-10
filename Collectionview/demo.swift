//
//  demo.swift
//  Collectionview
//
//  Created by Meghna on 09/09/21.
//

import UIKit

class demo: UIView {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var UILabel: UILabel!
            class func instanceFromNib() -> demo {
                return UINib(nibName: "demo", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! demo
            }
}
