//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by Kiran Sonne on 17/10/22.
//  Copyright © 2022 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var searchController: UISearchController!
    
    lazy var posts: [Post] =  {
       
        let model = Model()
        return model.postList
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.showsCancelButton = false
        
        for subView in searchController.searchBar.subviews {
            for subView1  in subView.subviews {
                if let textField = subView1 as? UITextField {
                    textField.backgroundColor = .brown
                    textField.textAlignment = .center
                }
            }
        }
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext  = true
        
        let searchBarContainer = SearchBarContainerView(customSearchBar: searchController.searchBar)
        searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        navigationItem.titleView = searchBarContainer
     }
    
    // MARK: Collectionview Data source and Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
        
        cell.exploreImageView.image = posts[indexPath.row].postImage
        return cell
        
    }
    
    
    
}
