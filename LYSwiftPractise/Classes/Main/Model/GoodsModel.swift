//
//  GoodsModel.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/16.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsModel: NSObject {
    
    var attributes:NSArray?
    var mainImage:NSString?
    var originPrice:NSString?
    var sellingPrice:NSString?
    var stockQuantity:NSString?
    
    init(dic:NSDictionary) {
        
        self.attributes = dic["attributes"] as? NSArray
        self.mainImage = dic["mainImage"] as? NSString
        self.originPrice = dic["originPrice"] as? NSString
        self.sellingPrice = dic["sellingPrice"] as? NSString
        self.stockQuantity = dic["stockQuantity"] as? NSString
    }
}

