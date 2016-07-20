//
//  PhotoOverlayViewController.swift
//  Lookz
//
//  Created by Fenglin on 12/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import Foundation
import UIKit

class PhotoOverlayViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CustomOverlayDelegate{
    
    @IBOutlet weak var imageOutput: UIImageView!
    let imagePicker = UIImagePickerController()
    var maskingImage = UIImage(named: "mask2.png")
    var clothingType = "Top"
    
//    let nc = NSNotificationCenter.defaultCenter()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updatePhotoOverlayViewDisable", name: "UIImagePickerControllerUserDidCaptureItem", object: nil)
        //begin NSNotification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.handleNotification), name: "_UIImagePickerControllerUserDidCaptureItem", object: nil)

        
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
//        let overlayView = UIView(frame: CGRect(x: 10, y: 50, width: 300, height: 300))
//        
//        //let overlayView =  (frame: CGRect()
//        var imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 300, height: 300))
//        
//        let maskingImage = UIImage(named: "mask3.png")
//        imageView.image = maskingImage
//        imageView.alpha = 0.5
//        overlayView.addSubview(imageView)
//        
//        imagePicker.cameraOverlayView = overlayView
        
        //customView stuff
        let customViewController = PhotoOverlayViewController(
            nibName:"PhotoOverlayViewControllerTemplate",
            bundle: nil
        )
        
//        var customView:CustomOverlayView = CustomOverlayView.loadFromNibNamed("PhotoOverlayViewControllerTemplate")! as! CustomOverlayView
////
        let customView: CustomOverlayView = customViewController.view as! CustomOverlayView
        
        customView.delegate = self
        customView.overlayImageView.image = UIImage(named: "mask2.png")

        
        customView.frame = CGRectMake(0 , self.imagePicker.view.frame.height * 0.07 , self.imagePicker.view.frame.width, self.imagePicker.view.frame.height * 0.81)

//        customView.frame = self.imagePicker.view.frame
        
        

        imagePicker.modalPresentationStyle = .FullScreen
        imagePicker.cameraOverlayView = customView
        
        self.presentViewController(imagePicker, animated: true, completion: {
//            self.imagePicker.cameraOverlayView = customView
            _ in
        })
    }
    @IBAction func choosePhoto(sender: AnyObject) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: { _ in })
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        print("Photo COMPLETED")
        self.dismissViewControllerAnimated(false, completion: nil)
        let maskedImage = maskImage(image!, mask: maskingImage!)
        self.imageOutput.image = maskedImage
        UIImageWriteToSavedPhotosAlbum(image, self,nil, nil) //save to the photo library
        
        performSegueWithIdentifier("showAddPhotoSegue", sender: nil)



    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func maskImage(image:UIImage, mask:(UIImage))->UIImage{
        
        let imageReference = image.CGImage
        let maskReference = mask.CGImage
        
        let imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
                                          CGImageGetHeight(maskReference),
                                          CGImageGetBitsPerComponent(maskReference),
                                          CGImageGetBitsPerPixel(maskReference),
                                          CGImageGetBytesPerRow(maskReference),
                                          CGImageGetDataProvider(maskReference), nil, true)
        
        let maskedReference = CGImageCreateWithMask(imageReference, imageMask)
        
        let maskedImage = UIImage(CGImage:maskedReference!)
        
        return maskedImage
    }
    
    //MARK: - Delegates
    
    //MARK: Image Picker Controller Delegates
//    func imagePickerController(
//        picker: UIImagePickerController,
//        didFinishPickingMediaWithInfo info: [String : AnyObject])
//    {
//        imagePicker.cameraOverlayView?.removeFromSuperview()
//        
//        print("TOOK PHOTO!!!!")
//
//        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //get the image from info
//        UIImageWriteToSavedPhotosAlbum(chosenImage, self,nil, nil) //save to the photo library
//        self.imageOutput.image = chosenImage
//
//        self.dismissViewControllerAnimated(false, completion: nil)
//
//
//    }
    
    
    //MARK: Custom View Delegates
    func didChangeTop(overlayView:CustomOverlayView) {
        maskingImage = UIImage(named: "mask2.png")
        clothingType = "Top"
        print("Change TOP")
    }
    
    func didChangePants(overlayView:CustomOverlayView) {
        maskingImage = UIImage(named: "mask3.png")
        clothingType = "Pants"
        print("Change Pants")
    }
    func didChangeSkirt(overlayView:CustomOverlayView) {
        maskingImage = UIImage(named: "mask4.png")
        clothingType = "Skirt"
        print("Change Skirt")
    }

    
    //MARK: NSNotificationCenter Methods
    func updatePhotoOverlayViewDisable(){
        print("DISABLE OVERLAY ACTION")
    }
    
    
    @objc func handleNotification(message: NSNotification) {
        if (message.name == "_UIImagePickerControllerUserDidCaptureItem") {
            // Cancel user interations in overlayview
            //self.imagePicker.cameraOverlayView = nil
            self.imagePicker.cameraOverlayView!.userInteractionEnabled = false;
            print("disable overlay ACTION")
        }
    }
    
    
    //MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showAddPhotoSegue" {
            
            print("segue activated!!")
            var destinationVC = segue.destinationViewController as! AddPhotoViewController

            destinationVC.imageToSave = self.imageOutput.image
            destinationVC.clothingType = clothingType
            
        }
        
    }
    
    @IBAction func unwindToPhotoOverlayViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
}