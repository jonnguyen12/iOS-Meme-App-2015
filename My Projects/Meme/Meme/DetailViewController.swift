//
//  DetailViewController.swift
//  Meme
//
//  Created by Phuc Nguyen on 7/26/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = meme.memedImage
    }
    
}
