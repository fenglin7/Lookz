//
//  AddPhotoViewController.swift
//  Lookz
//
//  Created by Fenglin on 18/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import UIKit
import RealmSwift

class AddPhotoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var imageToSaveView: UIImageView!
    @IBOutlet weak var imageNameTextView: UITextView!
    @IBOutlet var scrollView: UIScrollView!
    var clothingType = ""
    var imageToSave: UIImage!
    var clothing: Clothing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        imageNameTextView.delegate = self
        imageToSaveView.image = imageToSave!

        
        imageNameTextView.text = "Write something about your clothing..."
        imageNameTextView.textColor = UIColor.lightGrayColor()

    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
    }
    
    //MARK: TextViewDelegate methods
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
            textView.becomeFirstResponder()
            var scrollPoint : CGPoint = CGPointMake(0, self.imageNameTextView.frame.origin.y)
            self.scrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write something about your clothing..."
            textView.textColor = UIColor.lightGrayColor()
            self.scrollView.setContentOffset(CGPointZero, animated: true)
        }
    }
    
    //MARK: Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // ADD CODES FOR SAVING PHOTO
        
        let photoOverlayViewController = segue.destinationViewController as!PhotoOverlayViewController
        if segue.identifier == "Save" {
            //create new clothing object
            let clothing = Clothing()
            clothing.name = imageNameTextView.text ?? ""
            clothing.type = clothingType
            if let imageToSavePNG = UIImagePNGRepresentation(imageToSave){
                clothing.photo = imageToSavePNG
            }
            //RealmHelper.addClothing(clothing)
            
            // 3
            //listNotesTableViewController.notes = RealmHelper.retrieveNotes()
        }
    }
    
    
}
