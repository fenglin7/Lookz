//
//  GenLookViewController.swift
//  Lookz
//
//  Created by Fenglin on 20/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class GenLookViewController: UIViewController {
    
    var clothings : Results<Clothing>!
    var randomClothing : Clothing!
    
    @IBOutlet weak var lookImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clothings = RealmHelper.retrieveClothings()
        generateLook()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveLook(sender: AnyObject) {
        //save current look
    }
    
    func generateLook(){
        var topLeftType = ["Top"]
        var btmLeftType = ["Skirt","Pants"]
        var topRightType = ["Belt","Accessories"]
        var btmRightType = ["Shoes"]
        
        
        var arrayOfLook: [Int] = []
        arrayOfLook.append(RealmHelper.randomInt(topLeftType.count))
        arrayOfLook.append(RealmHelper.randomInt(btmLeftType.count))

        arrayOfLook.append(RealmHelper.randomInt(topLeftType.count))
        arrayOfLook.append(RealmHelper.randomInt(btmLeftType.count))

        let randomClothingTopLeft = RealmHelper.retrieveRandomClothingWithType(topLeftType[RealmHelper.randomInt(topLeftType.count)])
        let randomClothingBtmLeft = RealmHelper.retrieveRandomClothingWithType(btmLeftType[RealmHelper.randomInt(btmLeftType.count)])
        let randomClothingTopRight = RealmHelper.retrieveRandomClothingWithType(topLeftType[RealmHelper.randomInt(topLeftType.count)])
        let randomClothingBtmRight = RealmHelper.retrieveRandomClothingWithType(btmLeftType[RealmHelper.randomInt(btmLeftType.count)])
        
        
        
        lookImageView.image = makeLook(UIImage(data: randomClothingTopLeft.photo)!, UIImage(data: randomClothingBtmLeft.photo)!, UIImage(data: randomClothingTopRight.photo)!, UIImage(data: randomClothingBtmRight.photo)!)
    }
    
    func makeLook(images: UIImage...) -> UIImage{
        var contextSize = CGSizeZero
        
        for image in images {
            if images.indexOf(image)! % 2 == 0{
                contextSize.height = contextSize.height + image.size.height
            }
            else{
                contextSize.width = contextSize.width + image.size.width

            }
        }
        
        var imageOriginX: CGFloat = 0.0
        var imageOriginY: CGFloat = 0.0
        UIGraphicsBeginImageContextWithOptions(contextSize, false, UIScreen.mainScreen().scale)
        
        for image in images {
//            imageOriginX = (image.size.width) / 2
//            imageOriginY = (image.size.height) / 2
            
            image.drawInRect(CGRectMake(imageOriginX, imageOriginY, image.size.width, image.size.height))
            if images.indexOf(image)! % 2 == 0 {
                imageOriginY += (image.size.height)
            }
            else{
                imageOriginX += (image.size.width)
                imageOriginY -= (image.size.height)

            }
            
        }
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return combinedImage
    }
  
    @IBOutlet weak var saveLook: UIButton!
    
    
    //MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "saveLook" {
            
            print("Save Look segue activated!!")
            var destinationVC = segue.destinationViewController as! SaveGenLookViewController
            
            destinationVC.lookImage = self.lookImageView.image
            
        }
        
    }
    
    
    @IBAction func unwindToGenLookViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
}