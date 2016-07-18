//
//  AddPhotoViewController.swift
//  Lookz
//
//  Created by Fenglin on 18/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var imageToSaveView: UIImageView!
    @IBOutlet weak var imageNameTextView: UITextView!
    
    var imageToSave: UIImage!
    
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
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write something about your clothing..."
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
}
