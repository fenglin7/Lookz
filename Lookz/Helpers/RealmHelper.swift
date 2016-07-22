//
//  RealmHelper.swift
//  Lookz
//
//  Created by Fenglin on 19/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    //static methods will go here
    
    static func addClothing(clothing: Clothing) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(clothing)
        }
    }
    
    static func deleteClothing(clothing: Clothing) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(clothing)
        }
    }
    
    static func updateClothing(clothingToBeUpdated: Clothing, newClothing: Clothing) {
//        let realm = try! Realm()
//        try! realm.write() {
//            noteToBeUpdated.title = newNote.title
//            noteToBeUpdated.content = newNote.content
//            noteToBeUpdated.modificationTime = newNote.modificationTime
//        }
    }
    
    static func retrieveClothings() -> Results<Clothing> {
        let realm = try! Realm()
        return realm.objects(Clothing).sorted("modificationTime", ascending: false)
    }
    
    static func retrieveClothingsWithType(type: String) -> Results<Clothing>{
        let realm = try! Realm()
        return realm.objects(Clothing).filter("type == %@",type)
    }
    
    static func retrieveRandomClothingWithType(type: String) -> Clothing{
        let resultsOfType = retrieveClothingsWithType(type)
        let randomInt = self.randomInt(resultsOfType.count)
        return resultsOfType[randomInt]
    
    }
    
    static func randomInt(limit: Int)->Int{
        return Int(arc4random_uniform(UInt32(limit)))

    }
    
    
    //MARK: Looks helper functions
    static func addLook(look: Look) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(look)
        }
    }
    
    static func deleteLook(look: Look) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(look)
        }
    }
    
    static func retrieveLooks() -> Results<Look> {
        let realm = try! Realm()
        return realm.objects(Look).sorted("modificationTime", ascending: false)
    }

    
}
