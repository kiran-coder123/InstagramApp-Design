//
//  NewPostViewController.swift
//  InstagramApp
//
//  Created by Kiran Sonne on 17/10/22.
//  Copyright © 2022 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit


enum NewPostPagesToShow: Int {
    case library,camera
    
    var identifier: String {
        switch self {
        case .library:
            return "PhotoVC"
        case .camera:
            return "CameraVC"
        }
    }
    static func pagesToShow() -> [NewPostPagesToShow] {
        return [.library,.camera]
    }
    
    
}

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
       }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func libraryButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.library)
    }
    
    
    @IBAction func photoButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.camera)
    }
    
}
