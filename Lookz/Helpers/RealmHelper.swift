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
//
    
}
