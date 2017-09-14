//
//  Brain.swift
//  mySpending
//
//  Created by ITA student on 9/13/17.
//  Copyright © 2017 Alina Protsyuk. All rights reserved.
//

import Foundation

//1 - Adopt the NSObject and NSCoding protocols
class CategoryItem: NSObject, NSCoding {
    
    //5 - A safe way of naming my decoder key(s)
    struct Keys {
        static let item = ["item"]
    }
    
    private var _item = [String]()
    
    override init() {}
    
    //4 - my own initializer
    init(item: String) {
        self._item = [item]
    }
    
    //2 - this decodes our objects; this isn't called explicitly, it will be called with NSKeyedArchiver
    required init(coder decoder: NSCoder) {
        //this retrieves our saved name object and casts it as a string
        if let itemObject = decoder.decodeObject(forKey: Keys.item) as? String {
            _item = itemObject
        }
    }
    
    //3 - this encodes our objects (saves them)
    func encode(with coder: NSCoder) {
        //we are saving the name for the key "name"
        coder.encode(_item, forKey: Keys.item)
    }
    
    var name: String {
        get {
            return _item
        }
        set {
            _item = [newValue]
        }
    }
}


