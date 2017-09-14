//
//  DataStore.swift
//  mySpending
//
//  Created by ITA student on 9/14/17.
//  Copyright © 2017 Alina Protsyuk. All rights reserved.
//

import Foundation

class DataStore {
    
    static let sharedInstnce = DataStore()
    private init() {}
    var categoryItems: [CategoryItem] = []
}
