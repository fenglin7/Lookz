//
//  CustomOverlayView.swift
//  Lookz
//
//  Created by Fenglin on 14/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import UIKit

protocol CustomOverlayDelegate{
    func didChangeTop(overlayView:CustomOverlayView)
    func didChangePants(overlayView:CustomOverlayView)
    func didChangeSkirt(overlayView:CustomOverlayView)

}

class CustomOverlayView: UIView {
    
//    @IBOutlet weak var cameraLabel: UILabel!
//    var delegate:CustomOverlayDelegate! = nil
//    
//    @IBAction func cancelButton(sender: UIButton) {
//        cameraLabel.text = "I want to exit"
//        delegate.didCancel(self)
//    }
//    @IBAction func shootButton(sender: UIButton) {
//        cameraLabel.text = "Even Cooler Camera"
//        delegate.didShoot(self)
//    }
    
    var delegate:CustomOverlayDelegate! = nil
    
    @IBOutlet weak var overlayImageView: UIImageView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init()
    {
        self.init()
    }
    @IBAction func changeTop(sender: AnyObject) {
        overlayImageView.image = UIImage(named: "mask2.png")
        delegate.didChangeTop(self)
    }
    @IBAction func changePants(sender: AnyObject) {
        overlayImageView.image = UIImage(named: "mask3.png")
        delegate.didChangePants(self)
    }
    @IBAction func changeSkirt(sender: AnyObject) {
        overlayImageView.image = UIImage(named: "mask4.png")
        delegate.didChangeSkirt(self)
    }
    
//    @IBAction func cancelButton(sender: UIButton) {
////        cameraLabel.text = "I want to exit"
////        delegate.didCancel(self)
//    }
}

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}