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
    var isSelected:Bool?
    
    init(dic:NSDictionary) {
        
        self.attributes = dic["attributes"] as? NSArray
        self.mainImage = dic["mainImage"] as? NSString
        self.originPrice = dic["originPrice"] as? NSString
        self.sellingPrice = dic["sellingPrice"] as? NSString
        self.stockQuantity = dic["stockQuantity"] as? NSString
    }
}


class TypeModel: NSObject {
    
    var name:NSString?
    var isSelected:Bool?
    var isEnable:Bool?
    
    init(dic:NSDictionary) {
        self.name = dic["name"] as? NSString
        self.isSelected = dic["isSelected"] as? Bool
        self.isEnable = dic["isEnable"] as? Bool
    }
}

class TypeSectionModel: NSObject {
    
    var kind:NSString?
    var kindValue:NSArray?
    var data:NSMutableArray?
    
    init(dic:NSDictionary) {
        self.kind = dic["kind"] as? NSString
        self.kindValue = dic["kindValue"] as? NSArray
        self.data = NSMutableArray()
        self.data?.removeAllObjects()
        for i in 0..<self.kindValue!.count {
            let dic = self.kindValue![i] as! NSDictionary
            let model = TypeModel.init(dic: dic)
            self.data?.add(model)
        }
    }
}

class GoodsListModel: NSObject {
    
    var price:NSString?
    var dynamicImg:NSString?
    var praiseRate:NSString?
    var extenalFileds:NSDictionary?
    var catentdesc:NSString?
    var extenalFiledsModel:GoodsListExtenalFiledsModel?
    
    init(dic:NSDictionary) {
        self.price = dic["price"] as? NSString
        self.dynamicImg = dic["dynamicImg"] as? NSString
        self.praiseRate = dic["praiseRate"] as? NSString
        self.extenalFileds = dic["extenalFileds"] as? NSDictionary
        self.catentdesc = dic["catentdesc"] as? NSString
        self.extenalFiledsModel = GoodsListExtenalFiledsModel.init(dic: self.extenalFileds!)
    }
}

class GoodsListExtenalFiledsModel: NSObject {
    
    var commentShow:NSString?
    var paramValue:NSString?
    var appAttrTitle:NSArray?
    
    init(dic:NSDictionary) {
        self.commentShow = dic["commentShow"] as? NSString
        self.paramValue = dic["paramValue"] as? NSString
        self.appAttrTitle = dic["appAttrTitle"] as? NSArray
    }
}
