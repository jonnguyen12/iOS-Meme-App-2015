//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Phuc Nguyen on 7/24/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {

    var villain: Villain!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        imageView.image = UIImage(named: villain.imageName)
        label.text = villain.evilScheme
    }
}
