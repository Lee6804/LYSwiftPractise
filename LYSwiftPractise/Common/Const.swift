//
//  Const.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/7.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

let MianScreen = UIScreen.main.bounds

let MainWidth = UIScreen.main.bounds.width

let MainHeight = UIScreen.main.bounds.height

let MAINCOLOR = UIColor(red: 30/255, green: 102/255, blue: 207/255, alpha: 1)

let BACKGROUNGCOLOR = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)

func print<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("控制器:\(fileName)  第\(lineNumber)行  \(message)")
    #endif
}





