//
//  GoodsTypeCollectionViewCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/16.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

@objc protocol GoodsTypeCollectionViewCellDelegate:NSObjectProtocol {
    
    @objc optional func reloadCol()
}

class GoodsTypeCollectionViewCell: UICollectionViewCell {
    
    var indexPath:NSIndexPath?
    var model:TypeModel?
    var data:NSArray?
    
    lazy var typeBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        nBtn.setTitle("", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        nBtn.setTitleColor(MAINCOLOR, for: UIControlState.selected)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.addTarget(self, action: #selector(typeBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        nBtn.layer.cornerRadius = 5
        nBtn.layer.borderColor = UIColor.darkGray.cgColor
        nBtn.layer.borderWidth = 0.5
        return nBtn
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.typeBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate:GoodsTypeCollectionViewCellDelegate?
    
    @objc func typeBtnClick(sender:UIButton) {
  
        let sectionModel = self.data![(self.indexPath?.section)!] as? TypeSectionModel
        sectionModel?.data?.enumerateObjects({ (model, index, stop) in
            let model = model as! TypeModel
            model.isSelected = false
        })
        
        self.model?.isSelected = sender.isSelected ? false : true
        
        self.delegate?.reloadCol!()
    }
}


extension GoodsTypeCollectionViewCell {
    
    func refreshUI(model:TypeModel, indexPath:NSIndexPath, dataArr:NSArray) {
        
        self.data = dataArr
        self.model = model
        self.indexPath = indexPath
        self.typeBtn.setTitle(model.name! as String, for: UIControlState.normal)
        self.typeBtn.isSelected = model.isSelected!
        self.typeBtn.layer.borderColor = model.isSelected == true ? MAINCOLOR.cgColor : UIColor.darkGray.cgColor;
    }
    
    func colCellWidth(model:TypeModel) -> CGFloat {
    
        let cellWidth = self.getLabWidth(labelStr: model.name! as String, font: UIFont.systemFont(ofSize: 15), height: 36)
        return cellWidth + 20
    }
    
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize(width: 900, height: height)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        return strSize.width
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        var frame = model?.name?.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 36), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)], context: nil)
        frame?.size.height = 36
        attributes.frame = frame!
        
        self.typeBtn.frame = CGRect(x: 0, y: 0, width: attributes.frame.size.width + 20, height: 36)
        
        return attributes
    }
}


