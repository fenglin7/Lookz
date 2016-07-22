//
//  SaveGenLookViewController.swift
//  Lookz
//
//  Created by Fenglin on 22/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import Foundation
import UIKit

class SaveGenLookViewController : UIViewController, UITextViewDelegate{

    @IBOutlet weak var lookImageView: UIImageView!
    @IBOutlet weak var lookCaptionTextView: UITextView!
    var lookImage : UIImage!
    var look : Look?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        lookCaptionTextView.delegate = self
        lookImageView.image = lookImage!
        
        
        lookCaptionTextView.text = "Write something about your clothing..."
        lookCaptionTextView.textColor = UIColor.lightGrayColor()
        
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
        }
        textView.becomeFirstResponder()
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write something about your Look..."
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    //MARK: Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // ADD CODES FOR SAVING PHOTO
        
        let genLookViewController = segue.destinationViewController as! GenLookViewController
        if segue.identifier == "Save" {
            //create new clothing object
            let look = Look()
            look.caption = lookCaptionTextView.text ?? ""
            if let lookToSavePNG = UIImagePNGRepresentation(lookImage){
                look.photo = lookToSavePNG
            }
            
            look.modificationTime = NSDate()
            
            RealmHelper.addLook(look)
            print("SAVE NEW LOOK")
            
        }
    }
}