//
//  GoodsTypeCollectionViewCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/16.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsTypeCollectionViewCell: UICollectionViewCell {
    
    fileprivate lazy var typeBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("6GB+128GB 全网通", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        nBtn.setTitleColor(MAINCOLOR, for: UIControlState.selected)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.addTarget(self, action: #selector(typeBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(nBtn)
        return nBtn
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.typeBtn.snp.makeConstraints { (make) in
            make.top.width.height.equalToSuperview()
        }
        self.typeBtn.layer.cornerRadius = 5
        self.typeBtn.layer.borderColor = UIColor.darkGray.cgColor
        self.typeBtn.layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func typeBtnClick(sender:UIButton) {
        sender.isSelected = !sender.isSelected
        sender.layer.borderColor = sender.isSelected ? MAINCOLOR.cgColor : UIColor.darkGray.cgColor
    }
}


extension GoodsTypeCollectionViewCell {
    
    func refreshUI(str:NSString) {
        
        self.typeBtn.setTitle(str as String, for: UIControlState.normal)
    }
    
    func colCellWidth(str:NSString) -> CGFloat {
        
        let cellWidth = self.getLabWidth(labelStr: str as String, font: UIFont.systemFont(ofSize: 15), height: 36)
        return cellWidth + 20
    }
    
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize(width: 900, height: height)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        return strSize.width
    }
}


