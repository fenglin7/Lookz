//
//  ClothingItemViewController.swift
//  Lookz
//
//  Created by Fenglin on 20/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import UIKit

class ClothingItemViewController: UIViewController {
    var clothing: Clothing?
    
    @IBOutlet weak var clothingTypeLabel: UILabel!
    @IBOutlet weak var clothingImageView: UIImageView!
    @IBOutlet weak var clothingNameTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 1
        if let clothing = clothing {
            // 2
            clothingTypeLabel.text = clothing.type
            clothingNameTextView.text = clothing.name
            clothingImageView.image = UIImage(data: clothing.photo)
        } else {
            // 3
            clothingTypeLabel.text = ""
            clothingNameTextView.text = ""
            clothingImageView.image = nil
            
        }
    }
}
