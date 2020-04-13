//
//  Item.swift
//  Todoey
//
//  Created by Dustin on 2020/04/13.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

//#3 Nscoder, encodable - plist or json
//#2 encodable + decodable = codable
class Item: Codable {
    var title : String = ""
    var done : Bool = false
 
}
