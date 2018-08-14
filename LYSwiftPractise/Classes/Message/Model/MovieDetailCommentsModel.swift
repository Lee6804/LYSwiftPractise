//
//  MovieDetailCommentsModel.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/14.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MovieDetailCommentsModel: NSObject {

    var headImg:NSString?
    var name:NSString?
    var content:NSString?
    var isSupport:Bool?
    var supportCount:NSString?
}

extension MovieDetailCommentsModel {
    
    func initWithDic(infoDic:NSDictionary) {
        self.headImg = infoDic["headImg"] as? NSString
        self.name = infoDic["name"] as? NSString
        self.content = infoDic["content"] as? NSString
        self.isSupport = (infoDic["isSupport"] as? NSString)?.boolValue
        self.supportCount = infoDic["supportCount"] as? NSString
    }
}
