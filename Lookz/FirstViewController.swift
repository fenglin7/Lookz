//
//  FirstViewController.swift
//  Lookz
//
//  Created by Fenglin on 7/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    //@IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Image MASK guide
//        let image = UIImage(named: "image2.png")
//        let maskingImage = UIImage(named: "mask7.png")
//        imageView.image = maskImage(image!, mask: maskingImage!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    func maskImage(image:UIImage, mask:(UIImage))->UIImage{
//        
//        let imageReference = image.CGImage
//        let maskReference = mask.CGImage
//        
//        let imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
//                                          CGImageGetHeight(maskReference),
//                                          CGImageGetBitsPerComponent(maskReference),
//                                          CGImageGetBitsPerPixel(maskReference),
//                                          CGImageGetBytesPerRow(maskReference),
//                                          CGImageGetDataProvider(maskReference), nil, true)
//        
//        let maskedReference = CGImageCreateWithMask(imageReference, imageMask)
//        
//        let maskedImage = UIImage(CGImage:maskedReference!)
//        
//        return maskedImage
//    }


}

