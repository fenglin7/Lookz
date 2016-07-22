//
//  WardrobeViewController.swift
//  Lookz
//
//  Created by Fenglin on 12/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import UIKit
import RealmSwift

class WardrobeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var wardrobeTableView: UITableView!
    
    var clothings : Results<Clothing>! {
        didSet {
            wardrobeTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wardrobeTableView.delegate = self
        wardrobeTableView.dataSource = self
        clothings = RealmHelper.retrieveClothings()


        // do if no clothing in wardrobe ask them to take a photo

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        wardrobeTableView.reloadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView delegate Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothings.count
    }
    
    // 2
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClothingTableViewCell", forIndexPath: indexPath) as! ClothingTableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let clothing = clothings[row]
        
        // 3
        cell.clothingNameLabel.text = clothing.name
        cell.clothingTypeLabel.text = clothing.type

        
        // 4
        //cell.clothingModificationTimeLabel.text = clothing.modificationTime.convertToString()
        
        cell.clothingImageView.image = UIImage(data: clothing.photo,scale:1.0)
        
        return cell
    }
    
    //to link to display note
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "displayClothing" {
                print("Table view cell tapped")
                
                
                let indexPath = wardrobeTableView.indexPathForSelectedRow!
                let clothing = clothings[indexPath.row]
                let clothingItemViewController = segue.destinationViewController as! ClothingItemViewController
                clothingItemViewController.clothing = clothing
                
            } else if identifier == "addNote" {
                //print("+ button tapped")
            }
        }
    }
//
//    //to come back to Wardrobe
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
//
//    
   //to delete clothing
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            //1
            RealmHelper.deleteClothing(clothings[indexPath.row])
            //2
            clothings = RealmHelper.retrieveClothings()
        }
    }
    
}