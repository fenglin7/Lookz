////
////  Clothing.swift
////  Lookz
////
////  Created by Fenglin on 12/7/16.
////  Copyright © 2016 Fenglin. All rights reserved.
////
//
//

import Foundation
import RealmSwift

class Clothing: Object {
    dynamic var name = ""
    dynamic var type = ""
    dynamic var photo = NSData()
    dynamic var modificationTime = NSDate()

}

