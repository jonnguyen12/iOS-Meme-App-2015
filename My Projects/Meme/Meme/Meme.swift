//
//  Meme.swift
//  Meme
//
//  Created by Phuc Nguyen on 7/24/15.
//  Copyright (c) 2015 Phuc Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Meme: NSObject {
    
    var topText: String
    var bottomText: String
    var originalImage:UIImage!
    var memedImage: UIImage!
    
    init (topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
    
}