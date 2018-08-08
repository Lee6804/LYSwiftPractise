//
//  MainListCollectionViewCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/8.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MainListCollectionViewCell: UICollectionViewCell {
    
    fileprivate lazy var iconImg: UIImageView = { [unowned self] in
        let vImg:UIImageView = UIImageView()
        vImg.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(vImg)
        return vImg
    }()
    
    fileprivate lazy var headImg: UIImageView = { [unowned self] in
        let vImg:UIImageView = UIImageView()
        vImg.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(vImg)
        return vImg
    }()
    
    fileprivate lazy var nameLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 13)
        self.contentView.addSubview(vLabel)
        return vLabel
    }()
    
    fileprivate lazy var titleLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 10)
        vLabel.textColor = UIColor.darkGray
        self.contentView.addSubview(vLabel)
        return vLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 5
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.iconImg.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.width)
        let corners: UIRectCorner = [.topLeft,.topRight]
        self.iconImg.corner(byRoundingCorners: corners, radii: 5)
        
        self.headImg.frame = CGRect(x: 8, y: self.iconImg.frame.maxY + 8, width: 44, height: 44)
        self.headImg.layer.cornerRadius = 22
        self.headImg.layer.masksToBounds = true
        
        self.nameLabel.frame = CGRect(x: self.headImg.frame.maxX + 8, y: self.headImg.frame.origin.y, width: self.contentView.bounds.width - self.headImg.frame.maxX - 16 , height: 20)
        
        self.titleLabel.frame = CGRect(x: self.headImg.frame.maxX + 8, y: self.nameLabel.frame.maxY + 3, width: self.contentView.bounds.width - self.headImg.frame.maxX - 16 , height: 20)
        
    }
}

extension UIView {
/// 部分圆角 /// /// - Parameters: /// - corners: 需要实现为圆角的角，可传入多个 /// - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

extension MainListCollectionViewCell {
    
    func refreshUI(info: NSDictionary) {
        self.iconImg.image = UIImage(named: info["iconImg"] as! String)
        self.headImg.image = UIImage(named: info["headImg"] as! String)
        self.nameLabel.text = info["name"] as? String
        self.titleLabel.text = info["title"] as? String
    }
}

