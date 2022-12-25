//
//  StoryCollectionViewCell.swift
//  InstagramApp
//
//  Created by Kiran Sonne on 17/10/22.
//  Copyright © 2022 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storyImageView.layer.cornerRadius = storyImageView.frame.width / 2
        storyImageView.layer.masksToBounds = true
        storyImageView.layer.borderColor = UIColor.white.cgColor
        storyImageView.layer.borderWidth = CGFloat(3.0)
        


    }

}
