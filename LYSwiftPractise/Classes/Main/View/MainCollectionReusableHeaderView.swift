//
//  MainCollectionReusableHeaderView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/24.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MainCollectionReusableHeaderView: UICollectionReusableView {
    
    fileprivate lazy var cycleScrollView:SDCycleScrollView = { [unowned self] in
        let nView:SDCycleScrollView = SDCycleScrollView()
        nView.currentPageDotColor = MAINCOLOR
        nView.backgroundColor = UIColor.white
        nView.localizationImageNamesGroup = ["banner1.jpg","banner2.jpg","banner3.jpg","banner4.jpg","banner5.jpg","banner6.jpg","banner7.jpg","banner8.jpg"]
        self.addSubview(nView)
        return nView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.cycleScrollView.snp.makeConstraints { (make) in
            make.top.left.width.height.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
