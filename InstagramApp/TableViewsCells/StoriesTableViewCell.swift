//
//  StoriesTableViewCell.swift
//  InstagramApp
//
//  Created by Kiran Sonne on 17/10/22.
//  Copyright © 2022 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    
    lazy var stories: [Story] = {
       let model = Model()
        return model.storyList
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        selectionStyle = UITableViewCell.SelectionStyle.none
    
        storiesCollectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for:indexPath) as! StoryCollectionViewCell
        
        let stories = stories[indexPath.row]
        
        cell.storyImageView.image = stories.post.postImage
        cell.userNameLabel.text = stories.post.user.name
        
        
        
        
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 110)
        
    }
    
}
