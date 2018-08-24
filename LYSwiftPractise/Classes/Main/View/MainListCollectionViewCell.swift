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
    
    fileprivate lazy var catentdescLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 13)
        self.contentView.addSubview(vLabel)
        return vLabel
    }()
    
    fileprivate lazy var appAttrTitleLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 13)
        vLabel.textColor = UIColor.darkGray
        self.contentView.addSubview(vLabel)
        return vLabel
    }()
    
    fileprivate lazy var insigniaLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.text = "¥"
        vLabel.font = UIFont.boldSystemFont(ofSize: 10)
        vLabel.textColor = UIColor.orange
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var priceLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 15)
        vLabel.textColor = UIColor.orange
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var evaluationLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 10)
        vLabel.textColor = UIColor.darkGray
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var evaluationPercentLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 10)
        vLabel.textColor = UIColor.darkGray
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.iconImg.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(self.contentView.snp.width)
        }
        
        self.catentdescLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconImg.snp.bottom).offset(5)
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.height.equalTo(20)
        }
        
        self.appAttrTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.catentdescLabel.snp.bottom).offset(5)
            make.left.right.height.equalTo(self.catentdescLabel)
        }
        
        self.insigniaLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.appAttrTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(self.catentdescLabel)
            make.width.equalTo(10)
            make.height.equalTo(17)
        }
        
        self.priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.appAttrTitleLabel.snp.bottom).offset(5)
            make.left.equalTo(self.insigniaLabel.snp.right)
            make.right.height.equalTo(self.catentdescLabel)
        }
        
        self.evaluationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(5)
            make.left.height.equalTo(self.catentdescLabel)
        }
        
        self.evaluationPercentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.evaluationLabel)
            make.left.equalTo(self.evaluationLabel.snp.right).offset(10)
            make.right.height.equalTo(self.catentdescLabel)
        }
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
    
    func refreshUI(model: GoodsListModel) {
        
        self.iconImg.sd_setImage(with: NSURL(string: "https:\(model.dynamicImg ?? "")")! as URL, placeholderImage: UIImage(named: "nopic.jpg"))
        self.priceLabel.text = model.price! as String
        self.evaluationLabel.text = "\(model.extenalFiledsModel?.commentShow ?? "0")评价"
        self.evaluationPercentLabel.text = "\(model.praiseRate ?? "100%")好评"
        self.catentdescLabel.text = "\(model.catentdesc ?? "")"
        let appAttrTitleStr = model.extenalFiledsModel?.appAttrTitle?.componentsJoined(by: "|")
        self.appAttrTitleLabel.text = appAttrTitleStr
    }
}

