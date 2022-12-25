//
//  NewPostPageViewController.swift
//  InstagramApp
//
//  Created by Kiran Sonne on 19/10/22.
//  Copyright © 2022 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class NewPostPageViewController: UIPageViewController, UIPageViewControllerDelegate{

    var orderedViewControllers: [UIViewController] = [UIViewController]()
    var pagesToShow: [NewPostPagesToShow] = NewPostPagesToShow.pagesToShow()
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
     }
    private func newViewController(pageToShow: NewPostPagesToShow) -> UIViewController {
        var viewController: UIViewController!
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        
        switch pageToShow {
        case .library:
            viewController = newPostStoryboard.instantiateViewController(withIdentifier: pageToShow.identifier) as! PhotoLibraryViewController
        case .camera:
            viewController = newPostStoryboard.instantiateViewController(withIdentifier: pageToShow.identifier) as! CameraViewController
        }
        return viewController
    }
    
    func showViewController(index: Int) {
        
    }
    
}
