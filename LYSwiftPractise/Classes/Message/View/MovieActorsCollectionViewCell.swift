//
//  MovieActorsCollectionViewCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/13.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MovieActorsCollectionViewCell: UICollectionViewCell {
    
    fileprivate lazy var actorImg:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
        nImg.contentMode = UIViewContentMode.scaleAspectFit
        self.contentView.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var nameLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.textAlignment = NSTextAlignment.center
        nLabel.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.actorImg.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(self.actorImg.snp.width).offset(30)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.actorImg.snp.bottom).offset(5)
            make.left.right.equalTo(self.actorImg)
            make.height.equalTo(15)
        }
    }
}

extension MovieActorsCollectionViewCell {
    
    func refreshUI(actorImgStr:NSString, actorNameStr: NSString) {
        
        self.actorImg.sd_setImage(with: NSURL(string: actorImgStr as String)! as URL, placeholderImage: UIImage(named: "nopic.jpg"))
        self.nameLabel.text = actorNameStr as String
    }
}
