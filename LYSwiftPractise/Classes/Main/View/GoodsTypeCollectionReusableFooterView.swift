//
//  GoodsTypeCollectionReusableFooterView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/16.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsTypeCollectionReusableFooterView: UICollectionReusableView {
    
    var stockNum:NSInteger = NSInteger()
    
    fileprivate lazy var buyCountTitleLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "购买数量"
        nLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var stockLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "(库存:100)"
        nLabel.textColor = UIColor.lightGray
        nLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var reduceBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("－", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        nBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nBtn.backgroundColor = BACKGROUNGCOLOR
        nBtn.tag = 1000
        nBtn.addTarget(self, action: #selector(changeCountClick(sender:)), for: UIControlEvents.touchUpInside)
        nBtn.isEnabled = false
        self.addSubview(nBtn)
        return nBtn
        }()
    
    lazy var countTF:UITextField = { [unowned self] in
        let nTF:UITextField = UITextField()
        nTF.backgroundColor = BACKGROUNGCOLOR
        nTF.text = "1"
        nTF.font = UIFont.boldSystemFont(ofSize: 17)
        nTF.textColor = UIColor.black
        nTF.textAlignment = NSTextAlignment.center
        nTF.keyboardType = UIKeyboardType.numberPad
        nTF.isEnabled = false
        self.addSubview(nTF)
        return nTF
        }()
    
    fileprivate lazy var addBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("＋", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        nBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nBtn.backgroundColor = BACKGROUNGCOLOR
        nBtn.tag = 1001
        nBtn.addTarget(self, action: #selector(changeCountClick(sender:)), for: UIControlEvents.touchUpInside)
        self.addSubview(nBtn)
        return nBtn
        }()
    
    //MARK:数量改变点击事件
    @objc func changeCountClick(sender:UIButton) {
        var count:NSInteger = NSInteger(self.countTF.text!)!
        switch sender.tag {
        case 1000:
            count -= 1
            sender.isEnabled = count == 1 ? false : true
            break
        case 1001:
            if count == self.stockNum {
                print(message: "没有库存了哦~")
                return
            }
            count += 1
            self.reduceBtn.isEnabled = true
            break
        default:
            break
        }
        self.countTF.text = "\(count)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.buyCountTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(25)
            make.left.equalTo(self.snp.left).offset(20)
            make.height.equalTo(20)
        }
        
        self.stockLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.buyCountTitleLabel)
            make.left.equalTo(self.buyCountTitleLabel.snp.right).offset(5)
            make.height.equalTo(20)
        }
        
        self.addBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.width.height.equalTo(30)
        }
        
        self.countTF.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.addBtn)
            make.right.equalTo(self.addBtn.snp.left).offset(-1)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
        
        self.reduceBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.addBtn)
            make.right.equalTo(self.countTF.snp.left).offset(-1)
            make.width.height.equalTo(30)
        }
    }
}

extension GoodsTypeCollectionReusableFooterView {
    
    func refreshUI(stockNum:NSInteger) {
        
        self.stockNum = stockNum
        self.stockLabel.text = "(库存\(stockNum))"
        self.countTF.text = "1"
        self.reduceBtn.isEnabled = false
    }
}
