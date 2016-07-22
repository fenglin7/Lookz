//
//  Look.swift
//  Lookz
//
//  Created by Fenglin on 20/7/16.
//  Copyright © 2016 Fenglin. All rights reserved.
//

import Foundation
import RealmSwift

class Look: Object {
    dynamic var caption = ""
    dynamic var photo = NSData()
    dynamic var modificationTime = NSDate()
    
}