//
//  ImageCell.swift
//  VU Mobile Test
//
//  Created by MD RUBEL on 2/5/20.
//  Copyright © 2020 MD RUBEL. All rights reserved.
//

import UIKit
import LazyImage

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: LazyImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 5
    }

}
