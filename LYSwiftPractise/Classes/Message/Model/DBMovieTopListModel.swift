//
//  DBMovieTopListModel.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/8.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class DBMovieTopListModel: NSObject {
    
    var images: NSDictionary?
    var title: NSString?
    var casts: NSArray?
    var directors: NSArray?
    var rating: NSDictionary?
    var year: NSString?
    var movieId: NSString?
    
}


extension DBMovieTopListModel {
    
    func initWithDic(infoDic: NSDictionary) {
        self.images = infoDic["images"] as? NSDictionary
        self.title = infoDic["title"] as? NSString
        self.casts = infoDic["casts"] as? NSArray
        self.directors = infoDic["directors"] as? NSArray
        self.rating = infoDic["rating"] as? NSDictionary
        self.year = infoDic["year"] as? NSString
        self.movieId = infoDic["id"] as? NSString
    }
}
