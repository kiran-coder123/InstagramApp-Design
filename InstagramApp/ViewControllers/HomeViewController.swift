//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by Kiran Sonne on 17/10/22.
//  Copyright © 2022 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var homeTableView: UITableView!
    
    
    lazy var posts: [Post] = {
       let model = Model()
        return model.postList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.estimatedRowHeight = CGFloat(88.0)
        homeTableView.rowHeight = UITableView.automaticDimension
        
        homeTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        homeTableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "StoriesTableViewCell")
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeTableView.tableFooterView = UIView()
        
        var rightBarItemImage = UIImage(named: "send_nav_icon")
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage,style: .plain, target: nil, action: nil)
        
        var leftBarItemImage = UIImage(named: "camera_nav_icon")
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage,style: .plain, target: nil, action: nil)
        
        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        self.navigationItem.titleView = profileImageView
        
     }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell") as! StoriesTableViewCell
             return cell
        }
        
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
        let currentIndex = indexPath.row - 1
        let postData = posts[currentIndex]
        cell.profileImageView.image = postData.user.profileImage
        cell.postImageView.image = postData.postImage
        cell.dateLabel.text = postData.datePosted
        cell.likeCountLabel.text = "\(postData.likesCount) Likes"
        cell.postCommentLabel.text = postData.postComment
        cell.userNameTitleButton.setTitle(postData.user.name, for: .normal)
        cell.commentCountButton.setTitle("View all \(postData.commentCount) Comments", for: .normal)
        
        
        return cell
    }

     

}
