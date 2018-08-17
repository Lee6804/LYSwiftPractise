//
//  GoodsTypeCollectionReusableHeaderView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/16.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsTypeCollectionReusableHeaderView: UICollectionReusableView {
    
    lazy var titleLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
//        nLabel.text = "颜色"
        nLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(nLabel)
        return nLabel
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-10)
            make.height.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
